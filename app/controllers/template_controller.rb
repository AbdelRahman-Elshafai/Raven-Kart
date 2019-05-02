class TemplateController < ApplicationController
  def index
  end
  def single
  end
  def shopping
    @categories = Category.all
    @brands = Brand.all
    @products = Product.all
  end
end
