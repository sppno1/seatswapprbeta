class Search < ActiveRecord::Base
	belongs_to :user

	def search_tickets
		if departure_airport.blank? && airline.blank? && flight_num.blank? && departure_date.blank?
			tickets = []
		else			
			tickets = Ticket.all
			tickets = tickets.where("departure_airport LIKE ?","%#{departure_airport}%") if departure_airport.present?
			tickets = tickets.where("airline LIKE ?","%#{airline}%") if airline.present?
			tickets = tickets.where("flight_num LIKE ?","%#{flight_num}%") if flight_num.present?
			tickets = tickets.where(departure_date: departure_date) if departure_date.present?


			# tickets = tickets.where(["departure_date.to_date = #{departure_date}"])
			# tickets = tickets.where(["departure_date LIKE ?", "%#{departure_date}%"]) if departure_date.present?
			return tickets
		end
	end
end