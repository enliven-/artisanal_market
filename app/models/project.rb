class Project < ActiveRecord::Base
  attr_accessible :description, :name, :artisan_id, :img_file, :product_category_id, :palette_id,
                  :product_category_attributes, :palette_attributes

  has_attached_file :img_file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  after_save :notify_artisans
  
  belongs_to :customer, class_name: 'User'
  belongs_to :artisan,  class_name: 'User'
  
  has_one  :product_category
  has_one  :palette
  has_many :design_versions

  accepts_nested_attributes_for :product_category
  accepts_nested_attributes_for :palette


  def artisan_assigned?
    self.artisan_id ? true : false
  end
  
end
