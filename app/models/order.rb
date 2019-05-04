class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status, optional: true
  belongs_to :coupon, optional: true
  has_many :order_products
  has_many :products, through: :order_products

  # before_create :set_status

  before_create do
    self.status_id = 1
  end
end
