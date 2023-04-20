class DayPlanFacade 
  def self.create_day_plan_with_meals(user, date)
    day_plan = DayPlanService.create_user_day_plan(user.id, date)
    breakfast = RecipeService.get_preferred_breakfast_recipes(user)
    mains = RecipeService.get_preferred_lunch_dinner_recipes(user)
    x = breakfast[:results].first[:id]
    y = mains[:results].first[:id]
    z = mains[:results].second[:id]
    breakfast_recipe = RecipeFacade.recipe(x)
    main_recipe1 = RecipeFacade.recipe(y)
    main_recipe2 = RecipeFacade.recipe(z)
    DayPlanService.add_meal_to_day_plan(day_plan[:data], {meal: "breakfast", recipe_id: breakfast_recipe.id})
    DayPlanService.add_meal_to_day_plan(day_plan[:data], {meal: "main1", recipe_id: main_recipe1.id})
    DayPlanService.add_meal_to_day_plan(day_plan[:data], {meal: "main2", recipe_id: main_recipe2.id})
  end
end