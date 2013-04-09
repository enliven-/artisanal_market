class Project < ActiveRecord::Base
  attr_accessible :description, :name, :base_image
  attr_accessor :base_image_file_name
  has_attached_file :base_image, :styles => { :medium => "600x600>", :thumb => "100x100>" }
  after_save :notify_artisans
  
  belongs_to :customer
  belongs_to :artisan
  
  has_many :products
  
  private
  
  def notify_artisans
    # notify artisans
  end
  
end
