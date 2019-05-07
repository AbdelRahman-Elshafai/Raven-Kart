class TemplateController < ApplicationController
  before_action :create_cart_product_for_user

  def index
    @product = Product.first()
  end

  private
  def create_cart_product_for_user
    if user_signed_in? and !current_user.seller?
      @cart_product = current_user.shopping_cart.cart_products.new
    end
  end
end
