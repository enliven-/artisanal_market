class AttributeLayersAttributes < ActiveRecord::Migration
  def change
    create_table :attribute_layers_attributes do |t|
      t.integer :attribute_layer_id
      t.integer :attribute_id
    end
    
    add_column :projects, :product_category_id, :integer
  end
end
