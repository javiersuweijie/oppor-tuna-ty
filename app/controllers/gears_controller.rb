class GearsController < ApplicationController

  def index
    @gears = Gear.all
  end

  def show
    @gear = Gear.find(params[:id])
    @current_gear_location = @gear.gear_locations.last
    render :show
  end

  def update
    @gear = Gear.find(params[:id])
    @gear.update(gear_params)
    redirect_to gear_path(@gear)
  end

  def gear_params
    params.require(:gear).permit(gear_locations_attributes: [:lat,:lng,:gear_id])
  end
end
