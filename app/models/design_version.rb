class DesignVersion < ActiveRecord::Base
  attr_accessible :string

  belongs_to :project
end
