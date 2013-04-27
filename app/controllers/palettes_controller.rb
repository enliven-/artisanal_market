class PalettesController < ApplicationController

before_filter :authenticate_user!

  def index
    @palettes = Palette.where(user_id: current_user.id)
  end

  def show
    @palette = Palette.find(params[:id])
    @attribute_layers = @palette.attribute_layers
    @ids = @attribute_layers.map { |layer| layer.id }
    @attributes = Attribute.all.select {|attr| @ids.include?(attr.id) }
  end


  def new
    @palette = Palette.new
    @product_category = ProductCategory.new

  end

  def edit
    @palette = Palette.find(params[:id])
  end

  def create
    @palette = Palette.new(params[:palette])
    @palette.user = current_user
    @palette.save
    redirect_to edit_palette_path(@palette)
  end

  def update
    @palette = Palette.find(params[:id])
    @attribute_layer = @palette.attribute_layer.find()
  end

  def destroy
    @palette = Palette.find(params[:id])
    @palette.destroy
    redirect_to action: :index
  end

end
