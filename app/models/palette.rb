class Palette < ActiveRecord::Base
  attr_accessible :label

  has_many :attribute_layers
  belongs_to :user
  belongs_to :product_category

end
