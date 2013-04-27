class Attribute < ActiveRecord::Base
  attr_accessible :label, :attr_img, :attribute_layer_id

  belongs_to  :attribute_layer

  has_attached_file :attr_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
