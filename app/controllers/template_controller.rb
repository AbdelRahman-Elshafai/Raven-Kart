class TemplateController < ApplicationController
  def index
  end
  def single
  end

  def search_products
    @search = Product.solr_search do |searcher|
      searcher.fulltext search_params[:search]
    end

    puts @search.results
  end

  def new_products
    render "template/shop-grid"

  end

  def search_params
    params.permit(:search)
  end
end
