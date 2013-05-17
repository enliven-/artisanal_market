class ProjectsController < ApplicationController

  before_filter :authenticate_user!

  def index 
    @projects = Project.where("#{current_user.role}_id =?", current_user.id)
  end

  def show
    @project  = Project.find(params[:id])
    @products = Product.where("project_id=?", @project.id)
    @product_category_ids = @products.map { |product| product.product_category_id }
    @palettes = Palette.where("product_category_id=?", @product_category_ids)
  end

  def new
    @project = Project.new()
  end

  def edit
    @project = Project.find(params[:id])
    session[:project_id] = @project.id
    session[:counter] = @project.design_versions.all.size

    if @project.artisan_assigned?
      @attribute_layers = User.find(@project.artisan_id).palettes.first.attribute_layers
      @attribute = []
      @attribute_layers.each do |al|
        @attribute += al.attributes
      end
    end
  end

  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project])
      # if session[:project_id]
      #   @project.palette_id.nil? ? redirect_to(palette_project_path(@project)) : redirect_to(action: :index)
      # else
      #   redirect_to action: :index
      # end
      redirect_to :index
    else
      render :edit
    end
  end

  def create
    
    @project = Project.new(params[:project])
    if current_user.customer?
      @project.customer = current_user
    else
      @project.artisan = current_user
    end
    if @project.save
      # session[:project_id] = @project.id
      # session[:counter] = 0
      # session[:return_to] ||= request.referer
      # redirect_to category_project_path(@project)
      if @project.palette_id.nil?
        session[:project_id] = @project.id
        redirect_to new_palette_path
      elsif @project.product_category_id.nil?
        session[:project_id] = @project.id
        redirect_to new_product_category_path
      else
        redirect_to projects_path
      end
    else
      render :new
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to action: :index
  end
  
  def palette
    @project = Project.find(session[:project_id])
  end
  
  def category
    @project = Project.find(session[:project_id])
  end
  
  def attribute_layer
  end
end
