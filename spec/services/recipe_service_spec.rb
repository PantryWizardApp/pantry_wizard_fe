require "rails_helper"

RSpec.describe RecipeService do
  context "class methods" do
    context "search_recipes" do
      it "returns recipes based on search params" do
        recipe = File.read("spec/fixtures/recipe.json")
        stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?number=5&query=pasta").
         with(
           headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent'=>'Faraday v2.7.4',
          'X-Rapidapi-Key'=>ENV["X-RapidAPI-Key"]
           }).
         to_return(status: 200, body: recipe, headers: {})
        
        pasta = RecipeService.search_recipes("query=pasta&number=10")
        expect(pasta).to be_a(Hash)
        expect(pasta[:results].size).to eq(10)
        expect(pasta.keys).to eq([:results, :baseUri, :offset, :number, :totalResults, :processingTimeMs, :expires])
      end
    end

    context "get_recipe" do
      it "returns a recipe based on id" do
        blt_pasta = File.read("spec/fixtures/blt_pasta.json")
        stub_request(:get, "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/491786/information").
        with(
          headers: {
         'Accept'=>'*/*',
         'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
         'User-Agent'=>'Faraday v2.7.4',
         'X-Rapidapi-Key'=>ENV["X-RapidAPI-Key"]
          }).
        to_return(status: 200, body: blt_pasta, headers: {})
        blt = RecipeService.get_recipe(491786)
        expect(blt).to be_a(Hash)
        expect(blt[:id]).to eq(491786)
        expect(blt[:title]).to eq("Ranch BLT Pasta Salad")
      end
    end

    context "get_preferred_recipes" do
      it "returns a list of recipes based on user preferences" do
        data = {
          "data": {
              "id": "1234567890a",
              "type": "user",
              "attributes": {
                  "email": "bh@gmail.com",
                  "name": "Brian",
                  "google_id": "1234567890a",
                  "id": "1234567890a",
                  "intolerances": ["dairy", "egg"],
                  "likes": ["american", "italian"],
                  "dislikes": ["greek"],
                  "dietary_restrictions": "dairy"
              }
          }
        }
        user = User.new(data)

        VCR.use_cassette("get_preferred_recipes") do
          service = RecipeService.get_preferred_recipes(user)

          require 'pry'; binding.pry
        end
      end
    end
  end
end