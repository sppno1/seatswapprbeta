class PagesController < ApplicationController
	include Mobylette::RespondToMobileRequests

	def index
   # current_user_id = current_user.id
   	if current_user
   		@ticket = current_user.tickets
   	end
  end

  def show
  	if current_user
   		@ticket = Ticket.find params[:id]
   	end
  end

end
