class GearLocation < ActiveRecord::Base
  belongs_to :gear

  def coordinates
    "#{lat}, #{lng}"
  end
end
