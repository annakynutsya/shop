class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :product_orders
  has_many :product_orders, dependent: :destroy

  scope :ordered, -> { order(position: :desc) }
  scope :user_cart_products, ->(id) { find(id) }
end
