class SessionsController < ApplicationController
  def create
    UserFacade.create_user(user_info) unless UserFacade.find_user_by_google_id(user_info[:google_id])
    user = UserFacade.find_user_by_google_id(user_info[:google_id])
    session[:user] = user

    redirect_to "/dashboard"
  end 
  
  def log_out
    session.clear
    redirect_to root_path
  end
  
  private

  def user_info
    user_info = request.env["omniauth.auth"]
    User.raw_google_data(user_info)
  end

end