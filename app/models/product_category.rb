class ProductCategory < ActiveRecord::Base
  attr_accessible :label
  
  has_many :products
  has_one  :palette
  has_many :projects

end
