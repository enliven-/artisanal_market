class Catalogue < ActiveRecord::Base
  attr_accessible :label, :description, :product_ids

  belongs_to :user

  has_many :products
end
