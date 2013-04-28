class PalatteCategoryProductCategory < ActiveRecord::Migration
  def change
    create_table :palette_categories_product_categories do |t|
      t.references :palette_category
      t.references :product_category

    end
  end
end
