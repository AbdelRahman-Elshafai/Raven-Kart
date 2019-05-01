class StoresController < ApplicationController
  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = Store.find(params[:id])
    @products = @store.products
  end
end
