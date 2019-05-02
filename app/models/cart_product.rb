class CartProduct < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart

  validates :product_id, product_existance: true
  validates :quantity, 
    numericality: { only_integer: true, greater_than: 0 }
end
