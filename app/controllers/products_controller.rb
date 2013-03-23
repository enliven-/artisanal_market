class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @product.project_id = params[:project_id]
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    p params
    @product = Product.new(params[:product])
    @product.product_category_id = 1
    @product.save
    redirect_to controller: :projects, action: :show, id: @product.project_id
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to action: :index
  end

end
