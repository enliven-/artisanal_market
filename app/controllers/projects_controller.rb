class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def index 
    @projects = Project.where("#{current_user.role}_id =?", current_user.id)
  end

  def show
    @project = Project.find(params[:id])
    @products = Product.where("project_id=?", @project.id)
  end

  def new
    @project = Project.new()
  end

  def edit
    @project = Project.find(params[:id])
    @attribute_layers = User.find(@project.artisan_id).palette.artisan_layers
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    @project = Project.new(params[:project])
    @project.customer = current_user
    @project.save
    redirect_to action: :index
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to action: :index
  end
end
