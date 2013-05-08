class ProductCategory < ActiveRecord::Base
  attr_accessible :label
  
  has_many  :products
  has_one   :palette
  belongs_to :project

end
