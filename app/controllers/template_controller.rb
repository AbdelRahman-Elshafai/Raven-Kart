class TemplateController < ApplicationController
  def index
  end
  def single
  end

  def search_products
    @search = Sunspot.search Product do
      fulltext search_params[:search]
      with(:category_id , search_params[:category]) if search_params[:category].present?
      facet(:category_id)

    end
    @products = @search.results
    @total = @search.total
    @count = @products.count
    puts search_params[:category]


    render "template/shop-grid"
  end

  def search_params
    params.permit(:search, :category)
  end
end
