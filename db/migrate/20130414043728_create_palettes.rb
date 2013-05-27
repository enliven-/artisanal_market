class CreatePalettes < ActiveRecord::Migration
  def change
    create_table :palettes do |t|
      t.string :label

      t.integer :artisan_id, :project_id, :product_category_id

      t.timestamps
    end
  end
end
