# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

o = Organization.create(name: "Fundy North Fishermen’s Association")
v = Vessel.create(name: "Lobster Vessel #1", organization_id: o.id)

m1 = Member.create(email: "tohyongcheng@gmail.com", name: "Toh Yong Cheng", password: "password", password_confirmation: "password", vessel_id: v.id)
m2 = Member.create(email: "samuelchin@gmail.com", name: "Samuel Chin", password: "password", password_confirmation: "password", vessel_id: v.id)
m3 = Member.create(email: "andrewtoh@gmail.com", name: "Andrew Toh", password: "password", password_confirmation: "password", vessel_id: v.id)
m4 = Member.create(email: "javiersu@gmail.com", name: "Javier Su", password: "password", password_confirmation: "password", vessel_id: v.id)
m5 = Member.create(email: "wongshunhim@gmail.com", name: "Wong Shun Him", password: "password", password_confirmation: "password", vessel_id: v.id)
m6 = Member.create(email: "arronli@gmail.com", name: "Arron Li", password: "password", password_confirmation: "password", vessel_id: v.id)


20.times.each do |i|
  reg_id = "EAN" + rand(1000000..9999999).to_s
  g = Gear.create(gear_type: "Lobster Trap", reg_id: reg_id, vessel_id: v.id, missing: false)
  gl = GearLocation.create(lng:-66.501462+(rand-0.5)/3,lat:44.861117+(rand-0.5)/3, gear_id: g.id, private_sharing: true)
end
