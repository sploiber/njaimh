require 'csv'
class MembersController < ApplicationController
  before_filter :authorize_admin!, :except => [:index, :show, :autocom]
  def new
    @member = Member.new
  end
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = "Member has been created."
      redirect_to @member
    else
      flash[:notice] = "Member has not been created."
      render :action => "new"
    end
  end
  def index
    @members = Member.order("last_name").page(params[:page])
    if not params[:member_last_name].nil?
      @members = Member.order("last_name").by_last_name(params[:member_last_name]).page(params[:page])
    end
    #@members = Member.search params[:search], :order => :last_name, :page => params[:page], :per_page => 10
    #@last_names = Member.all.map(&:last_name)
    @last_names = Member.find(:all,:conditions => ['last_name LIKE ?', "#{params[:term]}%"]).map(&:last_name)
    respond_to do |format|
      format.html
      format.json { render :json => @last_names }
    end
  end
  def show
    @member = Member.find(params[:id])
  end
  def edit
    @member = Member.find(params[:id])
  end
  def update
    @member = Member.find(params[:id])
    if @member.update_attributes(params[:member])
      flash[:notice] = "Member has been updated."
      redirect_to @member
    else
      flash[:notice] = "Member has not been updated."
      redirect_to :action => "edit"
    end
  end
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "Member has been deleted."
    redirect_to members_path
  end
  def printExcel
    @o_format = params[:stuff_select]["o_format"]
    @file_name = "njaimh_members"
    @legend = "All Members Report"
    @data = Hash.new
    members = Member.find(:all)
    for m in members
      key = "#{m.last_name},#{m.first_name},#{m.address_1},#{m.address_2},#{m.city},#{m.county},#{m.state},#{m.zip},#{m.work_phone},#{m.work_extension},#{m.fax_number},#{m.home_phone},#{m.email_1},#{m.email_2},#{m.dues_paid_year},#{m.title_credential},#{m.print_org_member},#{m.print_org_member_type},#{m.print_board_member},#{m.print_exec_board_position},#{m.print_practice_area},#{m.print_endorsement_level}"
      @data[key] = m.agency
    end
    @csv_header = ["Last Name", "First Name", "Address_1", "Address_2", "City", "County", "State", "Zip", "Work Phone","Extension","Fax Number","Home Phone","Primary Email Address", "Secondary Email Address", "Dues Paid", "Title/Credential", "Member?", "MemberType", "Board?","BoardMemberType","PracticeArea","EndorsementLevel","Agency"]
    printCsv
  end
private
  def printCsv
    if @o_format == "CSV"
      csv_string = CSV.generate do |csv|
        csv << @csv_header
        @data.sort.each do |i|
          m = i[0].split(',')
          m << i[1]
          csv << m
        end
      end
      send_data csv_string, :type => "text/csv", :filename => "#{@file_name}.csv"
    else
      pdf = Prawn::Document.new
      x_out = DateTime.now.strftime("%B %d, %Y")
      pdf.font_size 20
      pdf.text "Franklin Township Food Bank", :align => :center
      pdf.font_size 10
      pdf.text "PO Box 333", :align => :center
      pdf.text "60 Millstone Road", :align => :center
      pdf.text "Somerset, NJ 08875-0333", :align => :center
      pdf.text "Telephone: (732) 246-0009", :align => :center
      pdf.text "email: fhasner@ftfb.us", :align => :center
      pdf.text "Website: http://www.franklinfoodbank.org", :align => :center
      pdf.font_size 14
      pdf.move_down 10
      pdf.text "Report Date: #{x_out}", :align => :center
      pdf.move_down 40
      pdf.font_size 20 
      pdf.text @legend, :align => :center
      pdf.move_down 20
      pdf.font_size 14
      table_out = []
      table_out << @csv_header
      @data.sort.each do |i|
        m = i[0].split(',')
        m << i[1]
        table_out << m
      end
      pdf.table table_out
      send_data pdf.render, :type => "application/pdf", :filename => "#{@file_name}.pdf"
    end
  end
end
