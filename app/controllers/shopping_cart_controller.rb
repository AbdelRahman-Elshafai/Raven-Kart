class ShoppingCartController < ApplicationController
    # TODO: use before action for show
    def show
        map_products_details_in_cart
        products_in_cart
        calculate_products_total
    end

    def empty_cart
        # TODO: use destroy to delete each product
    end
    
    private
      def map_products_details_in_cart
        cart_products = current_user.shopping_cart.cart_products
        @products_details = Hash.new
        cart_products.each do |product|
          @products_details[product.product_id] = {
              :quantity => product.quantity, 
              :id => product.id
            }
        end
        @products_details
      end
    
      def calculate_products_total
        @total = 0
        products_in_cart.each do |product|
            @total += product.price * map_products_details_in_cart[product.id][:quantity]
        end
        @total
      end
      
      def products_in_cart
        @products = current_user.shopping_cart.products
      end
end
