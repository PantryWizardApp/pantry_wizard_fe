class LocalRecipeService

  def self.user_recipes(user_id)
    response = conn.get("/api/v1/users/#{user_id}/recipes")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_recipe(recipe)
    response = conn.post("/api/v1/recipes", recipe)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_user_recipe(google_id, recipe_id)
    response = conn.delete("/api/v1/users/#{google_id}/recipes/#{recipe_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private 
  
  def self.conn 
    Faraday.new(url: "http://localhost:4000")
  end

end