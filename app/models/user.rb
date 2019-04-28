class User < ApplicationRecord
  has_many :addresses 
  has_many :products
  has_many :feedbacks
  has_many :orders
  has_one :store
  has_one :shopping_cart
  belongs_to :role
end
