require "rails_helper"

RSpec.describe RecipeService do
  context "class methods" do
    context "search_recipes" do
      it "returns recipes based on search params" do
        VCR.use_cassette('search_recipes') do
          pasta = RecipeService.search_recipes("query=pasta&number=5")
          expect(pasta).to be_a(Hash)
          expect(pasta[:results].size).to eq(5)
          expect(pasta.keys).to eq([:results, :baseUri, :offset, :number, :totalResults, :processingTimeMs, :expires])
        end
      end
    end

    context "get_recipe" do
      it "returns a recipe based on id" do
        VCR.use_cassette('search_recipe_id') do
          blt = RecipeService.get_recipe(491786)
          expect(blt).to be_a(Hash)
          expect(blt[:id]).to eq(491786)
          expect(blt[:title]).to eq("Ranch BLT Pasta Salad")
        end
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
          expect(service).to be_a(Hash)
          expect(service[:results].size).to eq(5)
        end
      end
    end
  end
end