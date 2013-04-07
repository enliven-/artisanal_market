class ProjectsController < ApplicationController

  before_filter :authenticate_customer!

  def index 
    @projects = Project.where("customer_id=?", current_customer.id)
    @customer = current_customer
  end

  def show
    @project = Project.find(params[:id])
    @products = Product.where("project_id=?", @project.id)
  end

  def new
    @project = Project.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def design
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    @new_image_url = @project.base_image.url
    render template: "projects/design"
  end

  def save_design
    @project = Project.find(params[:id])
    
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
    @project.customer_id = current_customer.id
    @project.save
    redirect_to action: :index
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to action: :index
  end

end
