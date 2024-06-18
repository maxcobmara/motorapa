class ProductsController < ApplicationController

  # GET /products or /products.json
  def index
    @search_products = Product.ransack(params[:q])
    if params[:category]
      @products = Product.where(category: params[:category])
    else
      @products = @search_products.result
    end
    
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.friendly.find(params[:id])
  end
  
  def index_search
    @q = params[:q]
    redirect_to products_path(q: @q)  
  end

end
