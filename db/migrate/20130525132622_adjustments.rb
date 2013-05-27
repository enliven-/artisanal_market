class Adjustments < ActiveRecord::Migration
  def change
    add_column :projects, :product_category_id, :integer
    add_column :projects, :palette_id, :integer

    add_column :palettes,  :project_id, :integer
    add_column :product_categories,  :project_id, :integer

  end
end
