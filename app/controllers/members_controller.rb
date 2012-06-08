class MembersController < ApplicationController
  def new
    @member = Member.new
  end
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = "Member has been created."
      redirect_to @member
    else
      flash[:member] = "Member has not been created."
      render :action => "new"
    end
  end
  def index
    @members = Member.all
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
      flash[:alert] = "Member has not been updated."
      redirect_to :action => "edit"
    end
  end
  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:notice] = "Member has been deleted."
    redirect_to members_path
  end
end
