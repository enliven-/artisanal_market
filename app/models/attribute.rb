class Attribute < ActiveRecord::Base
  attr_accessible :label, :attr_img, :attribute_layer_id
  
  attr_accessor :attr_img_file_name

  belongs_to  :attribute_layer

  has_attached_file :attr_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
