class ResourcesController < ApplicationController
  before_action :authenticate_user!

  def index
    @resources = apply_filter(params).paginate(page: params[:page])
  end

  def show
    @resource = Resource.find(params[:id])
    @note = Note.new
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = current_user.resources.build(resource_params)
    if @resource.save
      flash[:success] = 'Resource added.'
      redirect_to @resource
    else
      render :new
    end
  end

  def edit
    @resource = resource
  end

  def update
    @resource = resource
    if @resource.update_attributes(resource_params)
      flash[:success] = 'Resource updated.'
      redirect_to @resource
    else
      render :edit
    end
  end

  def destroy
    resource.destroy
    redirect_to params[:no_way_back].present? ? resources_url : :back
  end

  def mark_complete
    resource.mark_complete
    redirect_to :back
  end

  def mark_incomplete
    resource.mark_incomplete
    redirect_to :back
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :description)
  end

  def resource
    current_user.resources.find(params[:id])
  end

  def apply_filter(params)
    if params[:status] == 'completed'
      current_user.resources.completed
    elsif params[:status] == 'incompleted'
      current_user.resources.incompleted
    else
      current_user.resources
    end
  end
end
