class Gear < ActiveRecord::Base
  has_many :gear_locations
  belongs_to :vessel
  accepts_nested_attributes_for :gear_locations
end
