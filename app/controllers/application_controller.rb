class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  	def after_sign_out_path_for(resource_or_scope)
    	current_user.update! :score =>0
    	root_path
  	end

  	def after_sign_up_path_for(resource)
    	welcome_index_path
  	end	

  	def after_sign_in_path_for(resource) 
    	welcome_index_path

  	end
end
