class CartProductsController < ApplicationController

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
  
    # DELETE /cart_products/1
    # DELETE /cart_products/1.json
    def destroy
      @cart_product.destroy
      respond_to do |format|
        format.html { redirect_to cart_products_url, notice: 'Cart product was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
end
