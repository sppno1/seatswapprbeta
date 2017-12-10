class EmailapiController < ApplicationController
	include Mobylette::RespondToMobileRequests
	def index
	end

	def subscribe

	    @list_id = "c8c018d127"
	    gb = Gibbon::API.new

	    gb.lists.subscribe({
	      :id => @list_id,
	      :email => {:email => params[:email][:address]},
	      :merge_vars => {
	      	:MMERGE3 => {:zip => 'ZipCode'}
	      },
	      :double_optin => false
	      })

	    flash[:notice] = 'Thank you for your joining! We appreciate the interest.'
	end
end
