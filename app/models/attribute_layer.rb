class AttributeLayer < ActiveRecord::Base
  attr_accessible :label, :palette_id, :attribute_ids, :attributes_attributes

  has_many :attributes

  accepts_nested_attributes_for :attributes


end
