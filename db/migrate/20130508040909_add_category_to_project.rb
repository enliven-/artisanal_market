class AddCategoryToProject < ActiveRecord::Migration
  def change
    add_column :projects, :product_category_id, :integer
  end
end
