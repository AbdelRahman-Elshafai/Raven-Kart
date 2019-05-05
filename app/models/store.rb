class Store < ApplicationRecord
  has_many :products
  has_many :order_products, through: :products
  belongs_to :user

  validates :name , presence: true, uniqueness: true
  validates :summary , presence: true


  def orders
    Order.all
  end

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
