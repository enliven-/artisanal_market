class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string :label
      t.references :product_category
      t.references :attribute_layer
      t.references :user

      t.timestamps
    end
  end
end
