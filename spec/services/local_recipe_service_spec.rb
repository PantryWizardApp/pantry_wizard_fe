require "rails_helper"

RSpec.describe LocalRecipeService do
  context "get requests" do 
    it "can get all saved recipies" do 
      VCR.use_cassette('all_recipes') do
        recipes = LocalRecipeService.recipes
        data = recipes[:data]

        expect(data.count).to eq(32)
        expect(data).to be_an Array
        
        recipe = data.first

        expect(recipe[:id]).to eq("3")
        expect(recipe[:attributes][:spoonacular_id]).to eq(1234215343)
        expect(recipe[:attributes][:name]).to eq("oatmeal")
        expect(recipe[:attributes][:ingredients]).to eq("oats, water")
        expect(recipe[:attributes][:instructions]).to eq("idk mannn, JUST THROw IT IN THE WATER")
        expect(recipe[:attributes][:image]).to eq("https://spoonacular.com/recipeImages/595736-556x370.jpg")
      end
    end
  end
  context "post requests" do
    it "can create a new recipe asocciated with a day plan" do
      VCR.use_cassette('user_recipe_creation') do
        recipe_params = { name: 'brownies', ingredients: "sugar, chocolate, flour", instructions: "just throw it all in a bowl and mix, spread it out over a baking pan, bake unitl it no longer looks weird", spoonacular_id: "2345678901", image: "https://spoonacular.com/recipeImages/595736-556x370.jpg", day_plan_id: 1 }
        recipe = LocalRecipeService.create_recipe(recipe_params)
        data = recipe[:data]
        expect(data[:attributes][:name]).to eq(recipe_params[:name])
        expect(data[:attributes][:ingredients]).to eq(recipe_params[:ingredients])
        expect(data[:attributes][:instructions]).to eq(recipe_params[:instructions])
        expect(data[:attributes][:spoonacular_id]).to eq(recipe_params[:spoonacular_id].to_i)
        expect(data[:attributes][:image]).to eq(recipe_params[:image])
      end
      VCR.use_cassette('recipes_after_creation') do
        recipes = LocalRecipeService.recipes
        data = recipes[:data]

        expect(data.count).to eq(33)
        expect(data).to be_an Array

        newest_recipe = data.last
        expect(newest_recipe[:attributes][:name]).to eq('brownies')
        expect(newest_recipe[:attributes][:ingredients]).to eq("sugar, chocolate, flour")
        expect(newest_recipe[:attributes][:instructions]).to eq("just throw it all in a bowl and mix, spread it out over a baking pan, bake unitl it no longer looks weird")
        expect(newest_recipe[:attributes][:spoonacular_id]).to eq(2345678901)
        expect(newest_recipe[:attributes][:image]).to eq("https://spoonacular.com/recipeImages/595736-556x370.jpg")
      end
    end
  end
  context "delete requests" do
    it "deletes the given recipe" do
      VCR.use_cassette('recipe_deletion') do
        recipe_id = '40'
        recipe = LocalRecipeService.delete_recipe(recipe_id)
        data = recipe[:data]

        expect(data[:attributes][:name]).to eq('brownies')
        expect(data[:attributes][:ingredients]).to eq("sugar, chocolate, flour")
        expect(data[:attributes][:instructions]).to eq("just throw it all in a bowl and mix, spread it out over a baking pan, bake unitl it no longer looks weird")
        expect(data[:attributes][:spoonacular_id]).to eq(2345678901)
        expect(data[:attributes][:image]).to eq("https://spoonacular.com/recipeImages/595736-556x370.jpg")
      end

      VCR.use_cassette('recipes_after_deletion') do
        recipes = LocalRecipeService.recipes
        data = recipes[:data]

        expect(data.count).to eq(32)
        expect(data).to be_an Array
        
        newest_recipe = data.last
        expect(newest_recipe[:attributes][:name]).to_not eq('brownies')
        expect(newest_recipe[:attributes][:ingredients]).to_not eq("sugar, chocolate, flour")
        expect(newest_recipe[:attributes][:instructions]).to_not eq("just throw it all in a bowl and mix, spread it out over a baking pan, bake unitl it no longer looks weird")
        expect(newest_recipe[:attributes][:spoonacular_id]).to_not eq(2345678901)
      end
    end
  end
end