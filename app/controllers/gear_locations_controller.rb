class GearLocationsController < ApplicationController

  def index
    # get all locations
    @gear_locations = GearLocation.where(private_sharing: true)

    gon.gear_locations = @gear_locations.as_json(:include => [:gear])
    if member_signed_in?
      gon.current_vessel_id = current_member.vessel.id
    else
      gon.current_vessel_id = 0
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @gear_locations.as_json }
    end
  end

  def create
    gear = current_member.vessel.gears.order("updated_at ASC").first
    gl = GearLocation.create(gear_params.merge(gear_id: gear.id))

    respond_to do |format|
      format.json { gl.to_json }
    end
  end

  def collect
    GearLocation.find(params[:id]).update(private_sharing: false)
    redirect_to :gear_locations
  end

  def gear_params
    params.require(:gear_locations).permit(:lat,:lng,:gear_id,:private_sharing)
  end
end
