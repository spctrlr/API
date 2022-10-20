class ProductsController < ApplicationController
  before_action :set_brand
  before_action :set_product, only: %i[ show update destroy ]

  # GET /products
  def index
    @products = @brand.products.all
    render json: @products
  end

  # GET /products/1
  def show
    @product = @brand.products.find(params[:id])
    render json: @product
  end

  # POST /products
  def create
    @product = @brand.products.new(product_params)

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  private
    def set_brand
      @brand = Brand.find(params[:brand_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:product_name, :product_type, :status, :brands_id)
    end
end
