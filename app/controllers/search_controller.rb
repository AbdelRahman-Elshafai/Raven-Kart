class SearchController < ApplicationController
  before_action :create_cart_product_for_user 

  def search
    @search = Sunspot.search Product do
      fulltext search_params[:search]
      with(:category_id, search_params[:category]) if search_params[:category].present?
      with(:brand_id, search_params[:brand]) if search_params[:brand].present?
      with(:store_id, search_params[:store]) if search_params[:store].present?
      with(:price ).between(search_params[:min_price]..search_params[:max_price]) if search_params[:min_price].present?
      facet :category_id, :brand_id, :store_id, :price

      paginate page: search_params[:page] , per_page: 12


    end
    @products = @search.results
    @count = @products.count
    render "search/search"
  end

  def create_cart_product_for_user
    if user_signed_in? and !current_user.seller?
      @cart_product = current_user.shopping_cart.cart_products.new
    end
  end

  def search_params
    params.permit(:search, :category, :brand,:store, :min_price, :max_price , :page)
  end
end
