class Palette < ActiveRecord::Base
  attr_accessible :label, :product_category_id, :attribute_layer_ids
  validates_presence_of :label, :product_category_id
  
  has_and_belongs_to_many :attribute_layers
  belongs_to :user
  belongs_to :product_category
  belongs_to :project

end
