class ProductsController < ApplicationController

  # GET /products or /products.json
  def index
    if params[:category]
      @products = Product.where(category: params[:category])
    else
      @products = Product.all
    end
    
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.friendly.find(params[:id])
  end

end
