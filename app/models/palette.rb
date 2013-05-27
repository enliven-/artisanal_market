class Palette < ActiveRecord::Base
  attr_accessible :label, :product_category_id,
                  :attribute_layers_attributes
  
  has_many :attribute_layers

  belongs_to :artisan,  class_name: 'User'
  has_one    :product_category
  
  accepts_nested_attributes_for :attribute_layers

end
