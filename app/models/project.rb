class Project < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :customer
  has_many :products
end
