class Order < ApplicationRecord
  belongs_to :user
  belongs_to :status
  belongs_to :coupon
  has_many :order_products
  has_many :products, through: :order_products

  before_create :set_status

  private
  def set_status
    self.status_id = 1
  end
end
