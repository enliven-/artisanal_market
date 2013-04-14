class Project < ActiveRecord::Base
  attr_accessible :description, :name, :artisan_id, :file
  
  has_attached_file :file, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  after_save :notify_artisans
  
  belongs_to :customer, class_name: 'User'
  belongs_to :artisan,  class_name: 'User'
  
  has_many :products
  
  private
  
  def notify_artisans
    # notify artisans
  end
  
end
