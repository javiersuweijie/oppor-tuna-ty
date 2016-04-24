class GearLocation < ActiveRecord::Base
  belongs_to :gear
  attr_accessor :is_mine, :missing
  def coordinates
    "#{lat}, #{lng}"
  end
end
