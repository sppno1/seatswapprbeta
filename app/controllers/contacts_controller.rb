class ContactsController < ApplicationController
  include Mobylette::RespondToMobileRequests
  def new
      @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:error] = nil
      redirect_to root_path
      flash[:notice] = 'Thank you for your message! We appreciate the feedback.'
    else
      flash[:notice] = "** #{@contact.errors.full_messages.to_sentence}"
      render :new
    end
  end
end