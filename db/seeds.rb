# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  stones = Band.create!(:name => "The Rolling Stones")
  cream = Band.create!(:name => "Cream")
  
  exile_on_main_street = stones.albums.create!(
    :name => "Exile on Main Street",
    :year => 1972
  )
  disraeli_gears = cream.albums.create!(
    :name => "Disraeli Gears",
    :year => 1967
  )
  
  disraeli_gears.tracks.create!(
    :name => "Strange Brew",
    :ord  => 1
  )
  disraeli_gears.tracks.create!(
    :name => "Sunshine of Your Love",
    :ord  => 2
  )
end
