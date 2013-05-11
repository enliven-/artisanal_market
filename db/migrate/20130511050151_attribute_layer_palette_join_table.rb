class AttributeLayerPaletteJoinTable < ActiveRecord::Migration
  def change
    create_table :attribute_layers_palettes do |t|
      t.integer :palette_id
      t.integer :attribute_layer_id

    end
    
  end
end
