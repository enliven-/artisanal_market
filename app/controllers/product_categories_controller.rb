class ProductCategoriesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @product_categories = ProductCategory.all
  end

  def show
    @product_category = ProductCategory.find(params[:id])
  end

  def new
    @product_category = ProductCategory.new
  end
 
  def edit
    @product_category = ProductCategory.find(params[:id])
  end
 
  def create
    @product_category = ProductCategory.new(params[:product_category])
    @product_category.save
    p @product_category
    puts "-------------------------------------------"
    if session[:project_id]
      @project = Project.find(session[:project_id])
      # @project.update_attribute :product_category_id, @product_category.id
      # redirect_to palette_project_path(@project)
      puts "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx"
      redirect_to new_pallete_path
    else
      product_categories_path
    end
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy
    redirect_to action: :index
  end
  
end
