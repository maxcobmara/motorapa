class Admin::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /products or /products.json
  def index
    @search = Product.ransack(params[:q])
    @products = @search.result
    @products = @products.includes([:manufacturer])
    #@search.build_condition
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    @product.medium.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)
    @product.created_by = current_user.id

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_product_url(@product), notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def clone
    old_product = Product.friendly.find(params[:id])
    @product = old_product.dup
    @product.created_by = current_user.id
    @product.slug = nil
    render :new
  end



  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(
        :manufacturer_id, :model, :profile_pic, :model_code, :url, :category, :manufacturer_category, :assembled_in, :rrp,
        :seat_height_mm, :wheelbase_mm, :length_mm, :height_mm, :width_mm, :ground_clearance_mm, :kerb_weight_kg,
        :engine_description, :displacement, :topspeed_km, :max_power_ps, :max_power_rpm, :max_torque_nm, :max_torque_rpm, :cylinders, :cyl_bore, :cyl_stroke, :cyl_valves, :oil_capacity_l,
        :fuel, :fuel_capacity_l, :consumption_lkm, :range_km, :drive_category, :transmission, :clutch, :gears,
        :tyre_front, :tyre_rear, :tube, :tyre_category, :wheel_front_in, :wheel_rear_in, :brake_front_desc, :brake_rear_desc, :suspension_front, :suspension_rear,
        :launched_on, :retired_on,
        :battery_size, :cooling, :additional_features, :engine_card, medium_attributes: [:id, :title, :url, :url_source, :publisher, :published_on, :data, :_destroy]).merge(updated_by: current_user.id)
    end
end
