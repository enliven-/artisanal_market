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
    p "----------------------------------------------------------------"
    p params[:product_category]
    @product_category = ProductCategory.create(params[:product_category])
    redirect_to action: :index
  end

  def destroy
    @product_category = ProductCategory.find(params[:id])
    @product_category.destroy
    redirect_to action: :index
  end
  
end
