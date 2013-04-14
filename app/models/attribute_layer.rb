class AttributeLayer < ActiveRecord::Base
  attr_accessible :label

  belongs_to  :palette
  has_many    :attributes
end
