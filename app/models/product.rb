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

end
