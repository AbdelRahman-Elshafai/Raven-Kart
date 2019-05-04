class StoresController < ApplicationController
  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.where(user_id: current_user.id)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find(params[:id])
    @products = @store.products
    @requests = @store.requests
  end

  def confirm_status
    @stores = OrderProduct.find(params[:id])
    raise @stores.inspect
    @stores.update(status_id: 2)
    #FIXME:
    @orders = OrderProduct.where(order_id: @stores.order_id)
    @orders.each do |o|
      @ord = Order.find(o.order_id)
      if o.status_id == 2
        @conf = true
      else
        @conf = false
      end
      @conf
      if @conf
        @ord.update(status_id: 2)
      end
    end

    redirect_to stores_path, notice: 'Order confirmed.'
  end

  def deliver_status
    @stores = OrderProduct.find(params[:id])
    @stores.update(status_id: 3)
    redirect_to stores_path, notice: 'Order deliverd.'
  end
end
