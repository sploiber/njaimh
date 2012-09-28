class PracticeAreasController < ApplicationController
  before_filter :authorize_admin!
  def index
    @practice_areas = PracticeArea.order("name").page(params[:page])
  end
  def new
    @practice_area = PracticeArea.new
  end
  def create
    @practice_area = PracticeArea.new(params[:practice_area])
    if @practice_area.save
      flash[:notice] = "Practice Area has been created."
      redirect_to @practice_area
    else
      flash[:notice] = "Practice Area has not been created."
      render :action => "new"
    end
  end
  def show
    @practice_area = PracticeArea.find(params[:id])
  end
  def edit
    @practice_area = PracticeArea.find(params[:id])
  end
  def update
    @practice_area = PracticeArea.find(params[:id])
    if @practice_area.update_attributes(params[:practice_area])
      flash[:notice] = "Practice Area has been updated."
      redirect_to @practice_area
    else
      flash[:notice] = "Practice Area has not been updated."
      render :action => "edit"
    end
  end
end
