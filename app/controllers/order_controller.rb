class OrderController < ApplicationController
    def create
        @cart_products = current_user.shopping_cart.cart_products
        if @cart_products.count > 0        
            @order = current_user.orders.new
            if @order.save
                @cart_products = current_user.shopping_cart.cart_products
                @cart_products.each do |p|
                    @order.order_products.create(quantity: p.quantity, product_id: p.product_id, price: Product.find_by_id(p.product_id).price)
                    @product =  Product.find_by_id(p.product_id)
                    @new_stock = @product.stock - p.quantity
                    Product.find_by_id(p.product_id).update(stock: @new_stock)
                end
                @cart_products.each{ |p| p.destroy}
                redirect_to @order, notice: 'Order was successfully created.'
            else 
                redirect_to shopping_cart_path, alert: 'Order not created.'
            end
        else
            redirect_to shopping_cart_path, alert: 'Cart is empty!.'
        end
    end

    def show
      @order = Order.find(params[:id])
      @order_products = @order.order_products
      @total = 0
      @order_products.each do |order|
          @total += order.product.price * order.quantity
      end
      @order.update(total_price: @total)
    end

    private
        def order_params
            params.require(:order).permit()
        end 
end
