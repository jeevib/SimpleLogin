class ApplicationController < ActionController::Base
	before_action :require_login 
	protect_from_forgery with: :exception 
 	
 	def current_user 
 		@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
 	end 
 	
 	helper_method :current_user 
 	
 	def authenticate_user! 
  		redirect_to '/login' unless current_user 
 	end 

 	private
 	def require_login
 		unless !current_user.nil?
 			redirect_to login_path
 		end
 	end
end
