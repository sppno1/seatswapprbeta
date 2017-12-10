class Ticket < ActiveRecord::Base
	belongs_to :user

	validates :departure_airport, presence: true
	validates :airline, presence: true
	validates :flight_num, presence: true
	validates :flight_num, numericality: true
	validates :departure_date, presence: true
	validates :seat_num, presence: true
	# validates :price, presence: true
	
end