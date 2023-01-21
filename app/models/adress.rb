class Adress < ApplicationRecord
  belongs_to :user
  has_one :order_detail
end
