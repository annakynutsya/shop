class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :adress
  accepts_nested_attributes_for :adress
end
