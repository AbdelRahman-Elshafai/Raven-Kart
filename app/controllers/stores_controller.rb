class StoresController < ApplicationController
  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.where(user_id: current_user.id)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    # @store = Store.find(params[:id])
    @store = current_user.store
    @products = @store.products
    @requests = @store.requests
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

    redirect_to stores_path, notice: 'Order confirmed.'
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

    redirect_to stores_path, notice: 'Order delivered.'
  end
end
