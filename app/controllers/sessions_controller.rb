class SessionsController < ApplicationController
  def create
    user = User.new(user_info)
    if user.valid?
      session[:id] = user.id
      redirect_to "/users/#{user.id}/"
    else 
      redirect_to "/"
  end

  private

  def user_info
    request.env["omniauth.auth"]
  end
end