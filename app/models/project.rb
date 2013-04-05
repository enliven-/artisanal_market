class Project < ActiveRecord::Base
  attr_accessible :description, :name, :artisan_id
  
  after_save :notify_artisans
  
  belongs_to :customer
  belongs_to :artisan
  
  has_many :products
  
  private
  
  def notify_artisans
    # notify artisans
  end
  
end
