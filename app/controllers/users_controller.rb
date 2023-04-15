class UsersController < ApplicationController

  def show
    @user = UserFacade.find_user_by_google_id(current_user.google_id)
  end
end