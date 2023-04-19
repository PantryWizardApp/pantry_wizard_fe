class UsersController < ApplicationController

  def show
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
    @raw_day_plans = DayPlanService.user_day_plans(@user.id)
    @user_day_plans =  @raw_day_plans[:data].map do |day_plan|
      DayPlan.new(day_plan)
    end
  end
end