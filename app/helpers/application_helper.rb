module ApplicationHelper
	def header(text)
  	content_for(:header) { text.to_s }
	end

	def gravatar_for(user, size = 30, title = user.name)
  	image_tag gravatar_image_url(user.email, size: size), title: title, class: 'img-rounded'
	end

	def resource_name
	  :user
	end

	def resource
	  @resource ||= User.new
	end

	def resource_class 
    User 
	end

	def devise_mapping
	  @devise_mapping ||= Devise.mappings[:user]
	end

end
