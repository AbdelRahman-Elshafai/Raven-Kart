class CartProductsController < ApplicationController
  # before_action :set_cart_product, only: [:show, :edit, :update, :destroy]

  # GET /cart_products
  # GET /cart_products.json
  def index
    @cart_products = current_user.shopping_cart.cart_products.all
  end

  # GET /cart_products/1
  # GET /cart_products/1.json
  def show
  end

  # GET /cart_products/new
  def new
    # @cart_product = current_user.shopping_cart.cart_products.new
  end

  # GET /cart_products/1/edit
  def edit
  end

  def create
    # raise cart_product_params['product_id'].inspect
    @cart_product = current_user.shopping_cart.cart_products.new(cart_product_params)
    if @cart_product.save
      # TODO: redirect to shopping cart page
      redirect_to products_path, notice: 'Product was added to your cart successfully.' 
    else
      redirect_to product_path(params[:cart_product][:product_id]), alert: 'Product wasn\'t  added to your cart, please use valid inputs.'
    end
  end

  def update
    if get_cart_product.update(update_quantity)
      # TODO: redirect to shopping cart page
      redirect_to products_path, notice: 'Product was added to your cart successfully.'
    else
      redirect_to product_path(params[:cart_product][:product_id]), alert: 'Product wasn\'t  added to your cart, please try again later.'
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

  def add_to_cart
    if !products_in_cart.present? or !get_cart_product
      create
    else
      if product_stock < update_quantity[:quantity]
        redirect_to product_path(params[:cart_product][:product_id]), alert: 'You added more than the amount available in stock.'
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

    def update_quantity
      params[:cart_product][:quantity] = (get_cart_product.quantity).to_i + params[:cart_product][:quantity].to_i
      cart_product_update_params
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
end
