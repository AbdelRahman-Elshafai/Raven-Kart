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
end
