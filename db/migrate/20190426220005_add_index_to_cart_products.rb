class AddIndexToCartProducts < ActiveRecord::Migration[5.2]
  def change
    add_index :cart_products, [:product_id , :shopping_cart_id], unique: true
  end
end
