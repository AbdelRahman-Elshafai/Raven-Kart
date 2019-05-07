class RequestsController < ApplicationController
  before_action :authenticate_user! 
  authorize_resource :class => false

  def index
  end

  def show
    @stores = Store.where(user_id: current_user.id)
    @orders = Order.find(params[:id])
    @products = @orders.order_products
  end

  def confirm_status
    confirmed_product = OrderProduct.find(params[:id])
    confirmed_product.update(status_id: 2)

    order_products = OrderProduct.where(order_id: confirmed_product.order_id)
    products_no = 0
    order_products.each do |o|
      if o.status_id == 2
        products_no +=1
      end
    end

    if products_no == order_products.length
      order = Order.find(confirmed_product.order_id)
      order.update(status_id: 2)
    end

    redirect_to request_path(confirmed_product.order_id) , notice: 'Product confirmed.'
  end

  def deliver_status
    delivered_product = OrderProduct.find(params[:id])
    delivered_product.update(status_id: 3)

    order_products = OrderProduct.where(order_id: delivered_product.order_id)
    products_no = 0
    order_products.each do |o|
      if o.status_id == 3
        products_no +=1
      end
    end

    if products_no == order_products.length
      order = Order.find(delivered_product.order_id)
      order.update(status_id: 3)
    end

    redirect_to request_path(delivered_product.order_id), notice: 'Product delivered.'
  end
end
