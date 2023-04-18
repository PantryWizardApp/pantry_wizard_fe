class RecipeService
  
  def self.get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.search_recipes(params)
    get_url("/recipes/search?#{params}&number=5")
  end
  
  def self.get_recipe(id)
    get_url("/recipes/#{id}/information")
  end
  
  def self.get_preferred_recipes(user)
    params = {
    cuisine: user.likes.join(","),
    excludeCuisine: user.dislikes.join(","),
    intolerances: user.intolerances.join(","),
    diet: user.dietary_restrictions
  }
  
  get_url("/recipes/complexSearch?#{params}&number=5")
end

  private 
  
  def self.conn
    Faraday.new(url:"https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com") do |faraday|
      faraday.headers["X-RapidAPI-Key"] = ENV["X-RapidAPI-Key"]
    end
  end
end