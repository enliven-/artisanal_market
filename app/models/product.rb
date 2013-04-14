class Product < ActiveRecord::Base
  attr_accessible :description, :name, :project_id, :product_category_id

  belongs_to :project
  belongs_to :catalogue
  belongs_to :product_category
  belongs_to :user
  
end
