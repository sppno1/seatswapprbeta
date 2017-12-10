class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  rescue_from ActiveRecord::RecordNotFound do
	  flash[:warning] = 'Resource not found.'
	  redirect_back_or root_path
	end

	def redirect_back_or(path)
	  redirect_to request.referer || path
	end
	
  protect_from_forgery with: :exception
  include Mobylette::RespondToMobileRequests
  before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
	  devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :username, :ulocation, :email, :password, :password_confirmation) }
	  devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :username, :ulocation, :email, :password, :password_confirmation, :current_password) }
	end
end