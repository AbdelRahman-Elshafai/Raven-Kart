class TemplateController < ApplicationController
  def index
  end
  def single
  end

  def search_products
    @search = Product.solr_search do
      fulltext search_params[:search]
    end
    @products = @search.results
    @total = @search.total
    @count = @products.count
    puts @products
    puts @products.count
    render "template/shop-grid"
  end

  def search_params
    params.permit(:search)
  end
end
