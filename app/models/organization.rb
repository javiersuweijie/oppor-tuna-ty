class Organization < ActiveRecord::Base
  has_many :vessels
  has_many :members, through: :vessels
end
