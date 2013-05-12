class ProductCategory < ActiveRecord::Base
  attr_accessible :label
  
  has_many :products
  has_one  :palette
  has_and_belongs_to_many :projects

end
