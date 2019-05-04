class TemplateController < ApplicationController
  def index
  end
  def single
  end

  def search_products
    @search = Sunspot.search Product do
      fulltext search_params[:search]
      with(:category_id, search_params[:category]) if search_params[:category].present?
      with(:brand_id, search_params[:brand]) if search_params[:brand].present?
      with(:store_id, search_params[:store]) if search_params[:store].present?
      with(:price ).between(search_params[:min_price]..search_params[:max_price]) if search_params[:min_price].present?
      facet :category_id
      facet :brand_id
      facet :store_id
      json_facet(:price)

    end
    @products = @search.results
    @total = @search.total
    @count = @products.count

    render "template/shop-grid"
  end

  def search_params
    params.permit(:search, :category, :brand ,:store , :min_price , :max_price)
  end
end
