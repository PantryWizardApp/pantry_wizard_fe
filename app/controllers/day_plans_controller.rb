class DayPlansController < ApplicationController
  def new
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
  end

  def create
    user = UserFacade.find_user_by_google_id(current_user["google_id"])
    day_plan = DayPlanFacade.create_day_plan_with_meals(user, {date: params[:date_of_meal_plan]})
    redirect_to "/dashboard"
  end

  def show
  end
end