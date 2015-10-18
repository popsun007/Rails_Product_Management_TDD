class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments
  end

  def new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
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
    Product.find(params[:id]).update(product_params)
    redirect_to "/products"
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to "/products"
  end
private
  def product_params
    params.require(:product).permit(:name, :description, :pricing, :category_id)
  end
end
