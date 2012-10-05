class EndorsementLevelsController < ApplicationController
  before_filter :authorize_admin!
  def index
    @endorsement_levels = EndorsementLevel.order("name").page(params[:page])
  end
  def new
    @endorsement_level = EndorsementLevel.new
    @submit_label = "Create"
  end
  def create
    @endorsement_level = EndorsementLevel.new(params[:endorsement_level])
    if @endorsement_level.save
      flash[:notice] = "Endorsement Level has been created."
      redirect_to @endorsement_level
    else
      flash[:notice] = "Endorsement Level has not been created."
      render :action => "new"
    end
  end
  def show
    @endorsement_level = EndorsementLevel.find(params[:id])
  end
  def edit
    @endorsement_level = EndorsementLevel.find(params[:id])
    @submit_label = "Update"
  end
  def update
    @endorsement_level = EndorsementLevel.find(params[:id])
    if @endorsement_level.update_attributes(params[:endorsement_level])
      flash[:notice] = "Endorsement Level has been updated."
      redirect_to @endorsement_level
    else
      flash[:notice] = "Endorsement Level has not been updated."
      render :action => "edit"
    end
  end
end
