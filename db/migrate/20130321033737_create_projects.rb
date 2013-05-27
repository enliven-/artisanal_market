class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description

      t.integer :artisan_id, :customer_id, :product_category_id

      t.timestamps
    end
  end
end
