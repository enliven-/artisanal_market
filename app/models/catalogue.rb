class Catalogue < ActiveRecord::Base
  attr_accessible :label, :description

  belongs_to :user

  has_many :products
end
