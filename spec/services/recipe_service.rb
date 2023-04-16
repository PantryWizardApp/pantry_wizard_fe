require "rails_helper"

RSpec.describe RecipeService do
  context "class methods" do
    before :each do 
      @headers = {
      'Accept'=>'*/*',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'User-Agent'=>'Faraday v2.7.4',
      'X-Rapidapi-Key'=>ENV["X-RapidAPI-Key"]
       }
    end
    context "search_recipes" do
      it "returns recipes based on search params" do
        recipe = File.read("spec/fixtures/recipe.json")
        stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?query=pasta&number=10#pasta&number=5")
          .with(headers: @headers)  
          .to_return(status: 200, body: recipe, headers: @headers)
        
        pasta = RecipeService.search_recipes("query=pasta&number=10")
        require 'pry'; binding.pry
      end
    end
  end
end