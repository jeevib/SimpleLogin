class SessionsController < ApplicationController

  def login
  end
  
  def create
    # binding.pry
  	user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
	if user
      session[:user_id] = user.id
      render json: {
        status: :created,
        logged_in: true,
        user: user
    }
    else
      flash[:alert] = "Email or password is invalid" 
      render 'login'
    end
  end
end
