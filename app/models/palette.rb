class Palette < ActiveRecord::Base
  attr_accessible :label, :product_category_id, :attribute_layer_ids, :attribute_layers_attributes
  
  has_many :attribute_layers

  belongs_to :product_category
  belongs_to :user

  
  accepts_nested_attributes_for :attribute_layers

end
