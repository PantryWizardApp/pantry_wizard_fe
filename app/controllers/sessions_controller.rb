class SessionsController < ApplicationController
  def create
    user = User.new(user_info)
    require 'pry'; binding.pry
    session[:user] = user.
    else 
      redirect_to "/"
    end
  end 

  private

  def user_info
    request.env["omniauth.auth"]
  end
end