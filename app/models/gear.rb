class Gear < ActiveRecord::Base
  has_many :gear_locations
  belongs_to :vessel
end
