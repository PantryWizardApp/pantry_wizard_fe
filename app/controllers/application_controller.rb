class ApplicationController < ActionController::Base
  before_action :validate_user, only: %i[show]
  helper_method :current_user
  def current_user
    # require 'pry'; binding.pry
    @current_user ||= session[:user] if session[:user]
  end

  def validate_user
    if current_user == nil
      flash[:error] = "You must be logged in to access this page"
      redirect_to root_path 
    end
  end
end
 