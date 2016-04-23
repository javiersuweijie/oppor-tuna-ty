class Vessel < ActiveRecord::Base
  belongs_to :organization
  has_many :members
  has_many :gears
end
