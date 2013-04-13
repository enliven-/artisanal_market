class CreatePaletteCategories < ActiveRecord::Migration
  def change
    create_table :palette_categories do |t|
      t.string :label

      t.timestamps
    end
  end
end
