class PaletteCategory < ActiveRecord::Base
  attr_accessible :label
  
  has_and_belongs_to_many :product_categories
end
