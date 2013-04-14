class PalettesController < ApplicationController

  def index
    # @palettets = Palette.where("#{current_user.role}_id =?", current_user.id)
    @palettes = Palette.all

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

  def update
    @palette = Palette.find(params[:id])
    @attribute_layer = @palette.attribute_layer.find()

  end

end
