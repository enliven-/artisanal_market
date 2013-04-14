class Palette < ActiveRecord::Base
  attr_accessible :label

  has_many :attribute_layers
  belongs_to :artisan, class_name: 'User'
  belongs_to :product_category

end
