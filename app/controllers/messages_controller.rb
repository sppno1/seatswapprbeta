class MessagesController < ApplicationController
  before_action :authenticate_user!
  include Mobylette::RespondToMobileRequests

  def new
 		@chosen_recipient = User.find_by(id: params[:to].to_i) if params[:to]
		@ticket=Ticket.find_by(id: params[:ticket].to_i) if params[:ticket]
	end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end