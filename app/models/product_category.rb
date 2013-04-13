class ProductCategory < ActiveRecord::Base
  attr_accessible :label
  
  has_many :products
  has_and_belongs_to_many :palette_categories
end
