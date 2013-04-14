class PalettesController < ApplicationController

  def index
    @palettes = Palette.where("#{current_user.role}_id =?", current_user.id)
  end

  def show
    @palette = Palette.find(params[:id])
  end

  def new
    @palette = Palette.new()
  end

  def edit
    @palette = Palette.find(params[:id])
  end

  def create
    @palette = Palette.new(params[:palette])
    @palette.artisan = current_user
    @palette.save
    redirect_to edit_palette_path(@palette)
  end

  def update
    @palette = Palette.find(params[:id])
    @attribute_layer = @palette.attribute_layer.find()
  end

end
