class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string :label
      t.references :artisan
      t.references :product_category
      t.references :attribute_layer

      t.timestamps
    end
  end
end
