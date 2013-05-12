class ProductCategoriesProjectsJoinTable < ActiveRecord::Migration
  def change
    create_table :product_categories_projects do |t|
      t.integer :project_id
      t.integer :product_category_id
    end
    
    remove_column :projects, :product_category_id
    
  end
  
end
