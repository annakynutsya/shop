class Order < ApplicationRecord
  belongs_to :user, optional: true

  has_one :order_detail, dependent: :destroy
  has_one :adress, through: :order_detail

  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders

  accepts_nested_attributes_for :order_detail
end
