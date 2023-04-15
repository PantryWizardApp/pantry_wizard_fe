class DayPlanService

  def self.user_day_plans(google_id)
    response = conn.get("/api/v1/users/#{google_id}/day_plans")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.create_user_day_plans(google_id, day_plan)
    response = conn.post("/api/v1/users/#{google_id}/day_plans", day_plan)
  end

  private 
  
  def self.conn 
    Faraday.new(url: "http://localhost:5000")
  end
end