class Adress < ApplicationRecord
  belongs_to :user, optional: true
  has_one :order_detail, dependent: :destroy
end
