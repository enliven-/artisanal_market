class Palette < ActiveRecord::Base
  attr_accessible :label, :product_category_id
  validates_presence_of :label, :product_category_id
  
  has_many :attribute_layers
  belongs_to :user
  belongs_to :product_category
  belongs_to :project

end
