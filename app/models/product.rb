class Product < ApplicationRecord
  belongs_to :store
  belongs_to :brand
  belongs_to :category
  has_many :feedbacks
  has_many :cart_products
  has_many :shopping_carts, through: :cart_products
  has_many :order_products
  has_many :orders, through: :order_products
  has_many_attached :images

  validates :title, :description, 
    length: { minimum: 3 ,maximum: 255}
  validates :stock, 
    numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :price, 
    numericality: { only_integer: true, greater_than: 0 }
  validates :brand_id, :title, :description, :stock, :price, 
    presence: true
  validates :images,
  attached: true, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  limit: { min: 2, max: 6 }

  def product_category
    self.category.name
  end

  def product_brand
    self.brand.name
  end
end
