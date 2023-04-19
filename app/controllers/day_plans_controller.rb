class DayPlansController < ApplicationController
  def new
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
  end

  def create
    user = UserFacade.find_user_by_google_id(current_user["google_id"])
    day_plan = DayPlanService.create_user_day_plan(user.id, {date: params[:date_of_meal_plan]})
    redirect_to "/dashboard"
  end
end