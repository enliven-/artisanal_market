class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.references :project, :product_category, :user, :catalogue

      t.timestamps
    end
  end
end
