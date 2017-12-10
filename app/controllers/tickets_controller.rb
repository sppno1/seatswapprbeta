class TicketsController < ApplicationController

	before_action :authenticate_user!
	include Mobylette::RespondToMobileRequests
	
	def new
  	@ticket = Ticket.new
  	@airlines=Plane.all.map{|a| [a.airline_name]}
  	@airports=Location.all.map{|a| [a.airport_name]}
  	
	end

	def index
		# current_user_id = current_user.id
    @ticket = current_user.tickets
  end

  def show
 	 @ticket = Ticket.find params[:id]
	end


	def create
	  @ticket = Ticket.new(ticket_params)
	  @ticket.user_id = current_user.id
	  if @ticket.save
	    flash[:notice] = "#{@ticket.airline} ticket saved."
	    redirect_to @ticket
	  else
	  	flash[:notice] = "** #{@ticket.errors.full_messages.to_sentence}"
	  	@airlines=Plane.all.map{|a| [a.airline_name]}
  		@airports=Location.all.map{|a| [a.airport_name]}
	    render :new
	  end
	end

	def ticket_params
    params.require(:ticket).permit(:departure_airport, :airline, :flight_num, :departure_date, :seat_num, :price, :departure_time, :seat_desc)
  end 

  def edit
 		@ticket = Ticket.find params[:id]
 		@airlines=Plane.all.map{|a| [a.airline_name]}
 		@airports=Location.all.map{|a| [a.airport_name]}
	end
 
	def update
	  @ticket = Ticket.find params[:id]
	  if @ticket.update_attributes(ticket_params)
	    flash[:notice] = "** #{@ticket.airline} ticket saved."
	    redirect_to @ticket
	  else
	  	flash[:notice] = "** #{@ticket.errors.full_messages.to_sentence}"
	    render :edit
	  end
	end
 
	def destroy
	  ticket = Ticket.find params[:id]
	  ticket.destroy
	  flash[:notice] = "#{ticket.airline} ticket deleted."
	  redirect_to tickets_path
	end


	private
		def login_required
		  unless current_user
		    flash[:error] = 'Only logged in users can access this page.'
		    redirect_to tickets_path
		  end
		end

end
