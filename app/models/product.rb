class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :product_orders
  has_many :product_orders, dependent: :restrict_with_exception

  scope :ordered, -> { order(position: :desc) }
  scope :user_cart_products, ->(id) { find(id) }
end
