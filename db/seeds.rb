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
  
  stones.albums.create!(:name => "Exile on Main Street", :year => 1972)
  cream.albums.create!(:name => "Disraeli Gears", :year => 1967)
end
