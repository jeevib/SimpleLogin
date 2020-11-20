class SessionsController < ApplicationController

  def login
  end
  
  def create
  	user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
	if user
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash[:alert] = "Email or password is invalid" 
      render 'login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully Logged Out!'
    redirect_to '/login'
  end

end
