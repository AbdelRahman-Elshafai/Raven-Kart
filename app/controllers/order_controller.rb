class OrderController < ApplicationController
    before_action :authenticate_user!

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
                # @cart_products.each{ |p| p.destroy}
                # redirect_to @order, notice: 'Order was successfully created.'
                redirect_to empty_cart_path
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
      if @order.coupon_id == nil
        @order.update(total_price_after_sale: 0)
      else
        @price_discount = @order.total_price - @order.coupon.deduction_amount
        @order.update(total_price_after_sale: @price_discount)
      end   
      @coupon = Coupon.order("RAND()").limit(2)    
    end 

    def redeem
        @order = Order.find(params[:order_id])
        if @order.status_id == 1
            @order.update(coupon_id: params[:coupon_id])
            Coupon.find_by_id(params[:coupon_id]).decrement!(:usage_limit)
            redirect_to order_path(params[:order_id]), notice: "Congrats! you redeemed a coupon"
          else
            redirect_to order_path(params[:order_id]), alert: "Order is confirmed you cannot redeem"
          end
      
    end 
    private
        def order_params
            params.require(:order).permit()
        end 
end
