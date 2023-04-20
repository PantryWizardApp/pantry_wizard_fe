class UsersController < ApplicationController

  def show
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
    @raw_day_plans = DayPlanService.user_upcoming_day_plans(@user.id)
    @user_day_plans =  @raw_day_plans[:data].map do |day_plan|
      DayPlan.new(day_plan)
    end
  end

  def edit
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
  end

  def update
    user = UserFacade.find_user_by_google_id(current_user["google_id"])
    UserFacade.update_user(user, preferences_params)
    flash[:success] = "Preferences Updated!"
    redirect_to dashboard_path
  end
  
  private
  
  def liked_cuisines
    params[:user][:cuisines].select { |k, v| v.include?('Like') }.keys.join(', ')
  end
  
  def disliked_cuisines
    params[:user][:cuisines].select { |k, v| v.include?('Dislike') }.keys.join(', ')
  end

  def preferences_params
    { likes: liked_cuisines, 
      dislikes: disliked_cuisines, 
      dietary_restrictions: params[:user][:diet], 
      intolerances: params[:user][:intolerances]&.join(', ')}
  end
end