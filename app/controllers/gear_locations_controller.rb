class GearLocationsController < ApplicationController

  def index
    # get all locations
    @gear_locations = GearLocation.where(private_sharing: true)
    gon.gear_locations = @gear_locations.as_json(:include => [:gear])

    respond_to do |format|
      format.html {}
      format.json { render json: @gear_locations.as_json }
    end
  end

  def create
    gl = GearLocation.create(gear_id: params[:id], lat: params[:lat], lng: params[:lng], private_sharing: params[:private_sharing])

    respond_to do |format|
      format.json { res.to_json }
    end
  end

  def collect
    GearLocation.find(params[:id]).update(private_sharing: false)
    redirect_to :gear_locations
  end
end
