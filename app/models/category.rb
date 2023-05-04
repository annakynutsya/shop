class Category < ApplicationRecord
  has_many :products
  
  scope :ordered, -> { order(position: :desc) }
end
