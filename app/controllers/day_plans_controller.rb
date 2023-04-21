class DayPlansController < ApplicationController
  def new
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
  end

  def create
    user = UserFacade.find_user_by_google_id(current_user["google_id"])
    day_plan = DayPlanFacade.create_day_plan_with_meals(user, {date: params[:date_of_meal_plan]})
    if day_plan[:errors]
      redirect_to "/day_plans/new"
      flash[:error] = "You already have a meal plan for that day. Please select a different date."
    else
      redirect_to "/dashboard"
    end
  end

  def show
  end
end