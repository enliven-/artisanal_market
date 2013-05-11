class RemovePaletteIdFromAttrubteLayers < ActiveRecord::Migration
  def change
    remove_column :attribute_layers, :palette_id
  end
end
