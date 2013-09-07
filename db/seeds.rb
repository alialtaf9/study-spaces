# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach("/Users/susangreenberg/Documents/junior/pennapps/mainbuildings.csv") do |row| 
  m = Building.new
  m.update_attributes(:name => row[0], :address => row[1])
end

CSV.foreach("/Users/susangreenberg/Documents/junior/pennapps/studylocations.csv") do |row| 
  building = Building.find_by_name(row[1])
  if (building != nil)
    building.rooms.create(:name => row[0])
  end
end
