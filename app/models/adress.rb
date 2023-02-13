class Adress < ApplicationRecord
  belongs_to :user, optional: true
  has_one :order_detail, dependent: :destroy

  accepts_nested_attributes_for :order_detail, reject_if: proc { |attributes| attributes['title'].blank? }
end
