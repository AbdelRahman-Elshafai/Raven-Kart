class Store < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :order_products, through: :products
  has_many :orders, -> { distinct }, through: :products

  validates :name , presence: true, uniqueness: true
  validates :summary , presence: true
  validates :user_id , presence: true, uniqueness: true

  def requests
    self.order_products.all
  end

  def pending_requests
    self.order_products.where(status_id: 1)
  end
  
  def confirmed_requests
    self.order_products.where(status_id: 2)
  end

end
