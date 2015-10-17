class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    if product.valid?
      product.save
      redirect_to "/products"
    else
      errors = product.errors.full_messages
      redirect_to "/products/new", flash: {:errors => errors}
    end

  end

  def update
  end

  def destroy
  end
private
  def product_params
    params.require(:product).permit(:name, :description, :pricing)
  end
end
