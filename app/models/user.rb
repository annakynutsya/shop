class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_one :cart
  has_many :orders     
  has_many :addresses

  def current_cart
    if self.cart.empty?
      self.cart.create!
    end
    self.cart
  end
end
