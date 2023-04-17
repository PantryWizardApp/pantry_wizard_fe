class UsersController < ApplicationController

  def show
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
  end

  def edit
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
    # require 'pry'; binding.pry
  end

  def update
    # user = UserFacade.find_user_by_google_id(current_user["google_id"])
    # user.update(user_params)
    # redirect_to "/dashboard"
  end
end