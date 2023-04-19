class RecipesController < ApplicationController
  def show
    @user = UserFacade.find_user_by_google_id(current_user["google_id"])
    @recipe = RecipeFacade.recipe(params[:id])
  end

  def new_breakfast
    user = UserFacade.find_user_by_google_id(current_user["google_id"])
    recipe = RecipeService.get_preferred_breakfast_recipes(user)
    x = recipe[:results].first[:id]
    new_recipe = RecipeFacade.recipe(x)
    redirect_to "/meals/#{new_recipe.id}"
  end

  def new_main
    user = UserFacade.find_user_by_google_id(current_user["google_id"])
    recipe = RecipeService.get_preferred_main_recipes(user)
    x = recipe[:results].first[:id]
    new_recipe = RecipeFacade.recipe(x)
    redirect_to "/meals/#{new_recipe.id}"
  end
end