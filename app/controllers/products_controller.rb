class ProductsController < ApplicationController

  # GET /products or /products.json
  def index
    @search_products = Product.ransack(params[:q])
    if params[:category]
      @products = Product.where(category: params[:category])
      @search_products = @products.ransack(params[:q])
      @products = @search_products.result
    elsif params[:manufacturer]
      manufacturer = Manufacturer.find_by_name(params[:manufacturer]).id      
      @products = Product.where(manufacturer_id: manufacturer)
      @search_products = @products.ransack(params[:q])
      @products = @search_products.result
    else
      @products = @search_products.result
    end
    
  end

  # GET /products/1 or /products/1.json
  def show
    @product = Product.friendly.find(params[:id])
  end
  
  def search
    @search_products = Product.ransack(params[:q])
    @q = params[:q]
    redirect_to products_path(q: @q)  unless params[:q].nil?
  end

end
