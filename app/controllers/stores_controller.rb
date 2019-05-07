class StoresController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  # GET /stores
  # GET /stores.json
  def index
    @store = Store.find_by_user_id(current_user.id)
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @store = current_user.store
    @products = @store.products
  end
end
