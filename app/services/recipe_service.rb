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
      query: "*",
      cuisine: user.likes.join(","),
      excludeCuisine: user.dislikes.join(","),
      intolerances: user.intolerances.join(","),
      diet: user.dietary_restrictions 
      }
  
    get_url("/recipes/search?#{params}&number=5")
  end

  def self.get_preferred_breakfast_recipes(user)
    params = {
      query: "*",
      cuisine: user&.likes&.any? ? user&.likes.join(",") : "",
      excludeCuisine: user&.dislikes&.any? ? user&.dislikes.join(",") : "",
      intolerances: user&.intolerances&.any? ? user&.intolerances.join(",") : "",
      diet: user&.dietary_restrictions,
      type: "breakfast"
      }
      # query: "*",
      # cuisine: user.likes.any? ? user.likes.join(",") : "",
      # excludeCuisine: user.dislikes.any? ? user.dislikes.join(",") : "",
      # intolerances: user.intolerances.any? ? user.intolerances.join(",") : "",
      # diet: user.dietary_restrictions,
      
    
    offset = rand(0..500)
    get_url("/recipes/search?#{params}&number=1&offset=#{offset}&instructionsRequired=True")
  end

  def self.get_preferred_main_recipes(user)
    params = {
      query: "*",
      cuisine: user&.likes&.any? ? user&.likes.join(",") : "",
      excludeCuisine: user&.dislikes&.any? ? user&.dislikes.join(",") : "",
      intolerances: user&.intolerances&.any? ? user&.intolerances.join(",") : "",
      diet: user&.dietary_restrictions,
      type: "main course"
      }

      offset = rand(0..500)
      get_url("/recipes/search?#{params}&number=1&offset=#{offset}&instructionsRequired=True")
  end

  private 
  
  def self.conn
    Faraday.new(url:"https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com") do |faraday|
      faraday.headers["X-RapidAPI-Key"] = ENV["X-RapidAPI-Key"]
    end
  end
end