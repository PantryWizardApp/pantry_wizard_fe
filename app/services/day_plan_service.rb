class DayPlanService

  def self.user_day_plans(google_id)
    response = conn.get("/api/v1/users/#{google_id}/day_plans")
    day_plans = JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_day_plan(google_id, day_plan_id)
    response = conn.get("/api/v1/users/#{google_id}/day_plans/#{day_plan_id}")
    day_plan = JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user_day_plan(user_id, day_plan)
    response = conn.post("/api/v1/users/#{user_id}/day_plans", day_plan)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_user_day_plan(user_id, day_plan_id)
    response = conn.delete("/api/v1/users/#{user_id}/day_plans/#{day_plan_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_user_day_plan(google_id, day_plan_id, day_plan_changes)
    response = conn.patch("/api/v1/users/#{google_id}/day_plans/#{day_plan_id}", day_plan_changes)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.user_upcoming_day_plans(google_id)
    response = conn.get("/api/v1/users/#{google_id}/day_plans?q=upcoming")
    day_plans = JSON.parse(response.body, symbolize_names: true)
  end

  def self.add_recipe_to_day_plan(day_plan_id, recipe_id)
    response = conn.post("/api/v1/day_plan_recipes", {day_plan_id: day_plan_id, recipe_id: recipe_id})
    recipe_day_plan = JSON.parse(response.body, symbolize_names: true)
  end

  private 
  
  def self.conn 
    Faraday.new(url: "http://localhost:4000")
  end
end