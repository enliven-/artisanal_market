class CataloguesController < ApplicationController

  before_filter :authenticate_user!

  def index
    @catalogues = Catalogue.where("user_id =?", current_user.id)
    if current_user.customer?
      @artisans = User.all.select { |user| user.artisan? }
      @artisans.each do |artisan|
        @catalogues += artisan.catalogues
      end
    end
  end

  def show
    @catalogue = Catalogue.find(params[:id])
    @products = Product.where("catalogue_id=?", @catalogue.id)
  end

  def new
    @catalogue = Catalogue.new()
  end

  def edit
    @catalogue = Catalogue.find(params[:id])
    @products  = Product.where("user_id =?", current_user.id)
  end

  def update
    @catalogue = Catalogue.find(params[:id])
    if @catalogue.update_attributes(params[:catalogue])
      redirect_to action: :index
    else
      render :edit
    end
  end

  def create
    @catalogue = Catalogue.new(params[:catalogue])
    @catalogue.user = current_user
    @catalogue.save
    redirect_to action: :index
  end

  def destroy
    @catalogue = Catalogue.find(params[:id])
    @catalogue.destroy
    redirect_to action: :index
  end

end

