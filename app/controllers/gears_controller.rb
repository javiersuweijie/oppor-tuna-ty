class GearsController < ApplicationController

  def index
    @gears = Gear.all
  end

  def show
    @gear = Gear.find(params[:id])
    render :show
  end

end
