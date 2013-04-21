class Palette < ActiveRecord::Base
  attr_accessible :label, :product_category_id

  has_many :attribute_layers
  belongs_to :user
  belongs_to :product_category

end
