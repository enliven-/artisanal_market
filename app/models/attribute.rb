class Attribute < ActiveRecord::Base
  attr_accessible :label, :attr_img

  belongs_to  :attribute_layer

  has_attached_file :attr_img, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
end
