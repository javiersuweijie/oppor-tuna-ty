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

  def report_missing
    @gear = Gear.find(params[:id])
    @gear.update(missing: true, missing_timestamp: Time.now)

    respond_to do |format|
      format.html { redirect_to gear_locations_path }
      format.json { render json: @gear.as_json }
    end
  end

  def report_not_missing
    @gear = Gear.find(params[:id])
    @gear.update(missing: false)

    respond_to do |format|
      format.html { redirect_to gear_locations_path }
      format.json { render json: @gear.as_json }
    end
  end
end
