class Adress < ApplicationRecord
  belongs_to :user, optional: true
  has_one :order_detail, dependent: :restrict_with_exception

  accepts_nested_attributes_for :order_detail, reject_if: proc { |attributes| attributes['country'].blank? }
end
