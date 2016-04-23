class GearLocationsController < ApplicationController

  def index
    # get all locations
    @gear_locations = GearLocation.all
    gon.gear_locations = @gear_locations.as_json(:include => [:gear])
  end

  def create
    gl = GearLocation.create(gear_id: params[:id], lat: params[:lat], lng: params[:lng], private_sharing: params[:private_sharing])

    respond_to do |format|
      format.json { res.to_json }
    end
  end
end
