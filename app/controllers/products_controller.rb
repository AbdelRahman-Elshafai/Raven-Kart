class ProductsController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show ]
  load_and_authorize_resource
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :create_cart_product_for_user, only: [:index, :show]
  before_action :get_all_products, only: [:show_products_by_brand, :show_products_by_category, :index]
  before_action :prepare_index_data, only: [:index, :filter_products_by_category, :filter_products_by_brand]


  # GET /products
  # GET /products.json
  def index
  end

  # GET /products/1
  # GET /products/1.json
  def show
    if @product.stock > 0
      @availabile = true
    end
  end

  # GET /products/new
  def new
    @product = current_user.store_products.new
    prepare_form_data
  end

  # GET /products/1/edit
  def edit
    prepare_form_data
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_user.store_products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        prepare_form_data
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        prepare_form_data
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_products_by_brand
    @brands =  @products.group_by{|product| product.brand.name}
    render 'brands'
  end

  def show_products_by_category
    @categories =  @products.group_by{|product| product.category.name}
    render 'categories'
  end

  def filter_products_by_category
    @products = Product.where(category_id: params[:category])
    render :index
  end

  def filter_products_by_brand
    @products = Product.where(brand_id: params[:brand])
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.fetch(:product, {}).permit(:title, :description, :price, :stock, :brand_id, :category_id, images:[])
    end

    def format(list)
      output = Array.new
      list.each do |obj|
        output.push([obj.name, obj.id])
      end 
      output
    end

    def prepare_form_data
      @brands = format Brand.all
      @categories = format Category.all
    end

    def create_cart_product_for_user
      if user_signed_in? and !current_user.seller?
        @cart_product = current_user.shopping_cart.cart_products.new
      end
    end

    def get_all_products
      @products = Product.all
    end

    def prepare_index_data
      @categories = Category.all
      @brands = Brand.all
    end

end
