class Palette < ActiveRecord::Base
  attr_accessible :label, :product_category_id, :attribute_layer_ids, :attribute_layers_attributes
  
  has_and_belongs_to_many :attribute_layers
  belongs_to :user
  belongs_to :product_category
  has_many :projects
  
  accepts_nested_attributes_for :attribute_layers

end
