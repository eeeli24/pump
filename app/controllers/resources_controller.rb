class ResourcesController < ApplicationController

  def index
  end

  def show
    @resource = Resource.find(params[:id])
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      flash[:success] = 'Resource added.'
      redirect_to @resource
    else
      render :new
    end
  end

  private

  def resource_params
    params.require(:resource).permit(:title, :description)
  end
end
