# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'open-uri'

Location.delete_all
open("./db/airports.txt") do |airports|
	airports.read.each_line do |airport|
		Location.create!(:airport_name => airport)
	end
end

Plane.delete_all
open("./db/airlines.txt") do |airlines|
	airlines.read.each_line do |airline|
		Plane.create!(:airline_name => airline)
	end
end