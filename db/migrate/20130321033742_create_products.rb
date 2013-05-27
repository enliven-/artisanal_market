class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description

      t.integer :project_id, :product_category_id, :user_id, :catalogue_id

      t.timestamps
    end
  end
end
