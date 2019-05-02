class TemplateController < ApplicationController
  def index
  end
  def single
  end
  def shopping

    @categories = Category.all
    @brands = Brand.all
    if params[:category]
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id)
    elsif params[:brand]
      @brand_id = Brand.find_by(name: params[:brand]).id
      @products = Product.where(brand_id:@brand_id)
    else
      @products = Product.all
    end
  end
  def product_params
    params.fetch(:product, {}).permit(:title, :description, :price, :stock, :brand_id, :category_id, images:[])
  end
end
