class SearchesController < ApplicationController
	include Mobylette::RespondToMobileRequests
	
	def new
		@search = Search.new
		@airlines= Ticket.uniq.pluck(:airline)
		@departure_airports= Ticket.uniq.pluck(:departure_airport)
	end

	def create
		@search=Search.create(search_params)

		if @search.savedsearch == true
			@search.userid = current_user.id
			@search.save
		end		

		redirect_to @search
	end

	def show
		@search = Search.find(params[:id])
		session[:search_results] = request.url
	end

	private
	def search_params
		params.require(:search).permit(:departure_airport, :airline, :flight_num, :departure_date, :seat_num, :price, :savedsearch)
	end

end
