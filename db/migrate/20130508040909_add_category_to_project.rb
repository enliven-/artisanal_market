class AddCategoryToProject < ActiveRecord::Migration
  def change
    add_column :projects, :product_category_id, :integer
    add_column :projects, :palette_id, :integer
  end
end
