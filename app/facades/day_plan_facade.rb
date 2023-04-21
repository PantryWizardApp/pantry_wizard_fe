class DayPlanFacade 
  def self.create_day_plan_with_meals(user, date)
    day_plan = DayPlanService.create_user_day_plan(user.id, date)
    if day_plan[:errors]
      return day_plan
    else
      breakfast = RecipeService.get_preferred_breakfast_recipes(user)
      mains = RecipeService.get_preferred_lunch_dinner_recipes(user)
      x = breakfast[:results][0][:id]
      y = mains[:results][0][:id]
      z = mains[:results][1][:id]
      breakfast_recipe = RecipeFacade.recipe(x)
      main_recipe1 = RecipeFacade.recipe(y)
      main_recipe2 = RecipeFacade.recipe(z)
      a = LocalRecipeService.create_recipe(breakfast_recipe.recipe_poro_to_json)
      b = LocalRecipeService.create_recipe(main_recipe1.recipe_poro_to_json)
      c = LocalRecipeService.create_recipe(main_recipe2.recipe_poro_to_json)
      DayPlanService.add_recipe_to_day_plan(day_plan[:data][:id], a[:data][:id])
      DayPlanService.add_recipe_to_day_plan(day_plan[:data][:id], b[:data][:id])
      DayPlanService.add_recipe_to_day_plan(day_plan[:data][:id], c[:data][:id])
    end
  end
end