class ProductCategoriesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def index
    @product_categories = ProductCategory.all
  end

  def show
    @product_category = ProductCategory.find(params[:id])
  end

  # def new
#     @product_category = ProductCategory.new
#   end
#  
#   def edit
#     @product_category = ProductCategory.find(params[:id])
#   end
#  
#   def create
#     @product_category = ProductCategory.new(params[:product_category])
#   end

  
end
