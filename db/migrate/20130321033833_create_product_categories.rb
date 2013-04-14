class CreateProductCategories < ActiveRecord::Migration
  def change
    create_table :product_categories do |t|
      t.string :label
      t.references :palette
      t.references :product

      t.timestamps
    end
  end
end
