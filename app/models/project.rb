class Project < ActiveRecord::Base
  attr_accessible :description, :name, :artisan_id, :img_file, :palette_id, :product_category_id, 
                  :product_category_attributes, :palette_attributes, :attribute_layer_attributes, :attribute_attributes
  
  has_attached_file :img_file, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  
  after_save :notify_artisans
  
  belongs_to :customer, class_name: 'User'
  belongs_to :artisan,  class_name: 'User'
  
  has_many :products
  has_one  :product_category
  has_one  :palette
  has_many :design_versions

  accepts_nested_attributes_for :product_category
  accepts_nested_attributes_for :palette
  accepts_nested_attributes_for :attribute_layer
  accepts_nested_attributes_for :attribute

# >>>>>>> flow

  
  def artisan_assigned?
    self.artisan_id ? true : false
  end
  
  def palette_attributes=(attributes)
    self.palette = Palette.find_or_create_by_label(attributes[:label])
  end
  
  def product_category_attributes=(attributes)
    self.product_category = ProductCategory.find_or_create_by_label(attributes[:label])
  end

  def attribute_layer_attributes=(attributes)
    self.attribute_layer = AttributeLayer.find_or_create_by_label(attributes[:label])
  end

  def attribute_attributes=(attributes)
    self.attribute = Attribute.find_or_create_by_label(attributes[:label])
  end

  private
  
  def notify_artisans
    # notify artisans
  end
  
end
