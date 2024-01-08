class ManufacturersController < ApplicationController

  # GET /manufacturers or /manufacturers.json
  def index
    @manufacturers = Manufacturer.all
  end

  # GET /manufacturers/1 or /manufacturers/1.json
  def show
    @manufacturer = Manufacturer.friendly.find(params[:id])
  end

end
