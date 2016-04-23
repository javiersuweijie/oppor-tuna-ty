class VesselsController < ApplicationController
	before_action :authenticate_member!

	def index
  end

  def show
    @vessel = current_member.vessel
    @members = current_member.vessel.members
  end
end
