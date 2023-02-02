class Product < ApplicationRecord
  belongs_to :category
  has_many :orders, through: :product_orders, dependent: :destroy
  has_many :product_orders, dependent: :destroy

  scope :ordered, -> { order(position: :desc) }
end
