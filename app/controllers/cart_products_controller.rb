class CartProductsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource  
  before_action :set_cart_product, only: [:remove_from_cart, :destroy]

  def add_to_cart
    if !products_in_cart.present? or !get_cart_product
      if product_stock < create_quantity
        redirect_extra_stock
      else
        create
      end
    else
      if product_stock < update_quantity[:quantity]
        redirect_extra_stock
      else
        update
      end
    end
  end

  def remove_from_cart
    if @cart_product.quantity > 1
      @cart_product.decrement(:quantity)
      @cart_product.save
    else
      destroy
    end
    redirect_to shopping_cart_path, notice: 'Product was removed from your cart successfully.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart_product
      @cart_product = CartProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_product_params
      params.require(:cart_product).permit(:quantity, :product_id)
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_product_update_params
      params.require(:cart_product).permit(:quantity)
    end

    def update_quantity
      params[:cart_product][:quantity] = (get_cart_product.quantity).to_i + params[:cart_product][:quantity].to_i
      cart_product_update_params
    end

    def create_quantity
      cart_product_params[:quantity].to_i
    end

    def products_in_cart
      current_user.shopping_cart.cart_products
    end

    def get_cart_product
      products_in_cart.find_by_product_id(cart_product_params[:product_id])
    end

    def product_stock
      @product = Product.find_by_id(cart_product_params[:product_id])
      @product.stock
    end

    def redirect_extra_stock
      redirect_to product_path(params[:cart_product][:product_id]), alert: 'You added more than the amount available in stock.'
    end
    
    def redirect_error_on_action
      redirect_to product_path(params[:cart_product][:product_id]), alert: 'Product wasn\'t  added to your cart, please try again later.'
    end

    def redirect_success_on_action
      redirect_to shopping_cart_path, notice: 'Product was added to your cart successfully.'
    end

    def create
      @cart_product = current_user.shopping_cart.cart_products.new(cart_product_params)
      if @cart_product.save
        redirect_success_on_action
      else
        redirect_error_on_action
      end
    end
  
    def update
      if get_cart_product.update(cart_product_update_params)
        redirect_success_on_action
      else
        redirect_error_on_action
      end
    end
  
    def destroy
      @cart_product.destroy
    end
end
