class Product < ActiveRecord::Base
  attr_accessible :description, :name

  belongs_to :project
end
