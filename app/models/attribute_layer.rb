class AttributeLayer < ActiveRecord::Base
  attr_accessible :label, :palette_id, :attribute_ids, :attributes_attributes

  has_and_belongs_to_many :palette
  has_and_belongs_to_many :attributes
end
