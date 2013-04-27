class User < ActiveRecord::Base
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :name, :customer_id, :artisan_id
    
  has_many :projects
  has_many :products
  has_many :palettes
  has_one  :catalogue
    
  scope :customers, where(role: CUSTOMER)
  scope :artisans, where(role: ARTISAN)
  
  def roles_symbol
    [role.to_sym]
  end
  
  def customer?
    true if self.role == CUSTOMER
  end
  
  def artisan?
    true if self.role == ARTISAN
  end

  def init_catalogue


  
end
