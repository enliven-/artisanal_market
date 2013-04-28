class AttributeLayer < ActiveRecord::Base
  attr_accessible :label, :palette_id

  belongs_to  :palette
  has_many    :attributes
end
