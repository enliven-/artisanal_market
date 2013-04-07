class ProjectsController < ApplicationController

  # before_filter :authenticate_customer!, except: [:index_artisan]
  before_filter :authenticate_artisan!, only: [:index_artisan]

  def index 
    if customer_signed_in?
      @projects = current_customer.projects
      @user = current_customer
    else
      @projects = current_artisan.projects
      @user = current_artisan
    end
    
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
