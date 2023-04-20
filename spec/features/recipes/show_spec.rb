require "rails_helper"

RSpec.describe "Recipe Show Page" do
  describe "as a user" do
    before :each do
      recipe1 = {
      "vegetarian": false,
      "vegan": false,
      "glutenFree": false,
      "dairyFree": false,
      "veryHealthy": false,
      "cheap": false,
      "veryPopular": true,
      "sustainable": false,
      "lowFodmap": false,
      "weightWatcherSmartPoints": 16,
      "gaps": "no",
      "preparationMinutes": -1,
      "cookingMinutes": -1,
      "aggregateLikes": 32767,
      "healthScore": 4,
      "creditsText": "Cinnamon Spice and Everything Nice",
      "sourceName": "Cinnamon Spice and Everything Nice",
      "pricePerServing": 137.63,
      "extendedIngredients": [
          {
              "id": 20420,
              "aisle": "Pasta and Rice",
              "image": "fusilli.jpg",
              "consistency": "SOLID",
              "name": "radiatore pasta",
              "nameClean": "pasta",
              "original": "8 ounces radiatore pasta (or another type of medium-sized pasta)",
              "originalName": "radiatore pasta (or another type of medium pasta)",
              "amount": 8.0,
              "unit": "ounces",
              "meta": [
                  "(or another type of medium pasta)"
              ],
              "measures": {
                  "us": {
                      "amount": 8.0,
                      "unitShort": "oz",
                      "unitLong": "ounces"
                  },
                  "metric": {
                      "amount": 226.796,
                      "unitShort": "g",
                      "unitLong": "grams"
                  }
              }
          },
          {
              "id": 4114,
              "aisle": "Oil, Vinegar, Salad Dressing",
              "image": "italian-dressing.jpg",
              "consistency": "LIQUID",
              "name": "salad dressing",
              "nameClean": "salad dressing",
              "original": "1 bottle Hidden Valley® Original Ranch® Salad Dressing (8 ounces)",
              "originalName": "bottle Hidden Valley® Original Ranch® Salad Dressing",
              "amount": 8.0,
              "unit": "ounces",
              "meta": [
                  "hidden valley®",
                  "original ranch®"
              ],
              "measures": {
                  "us": {
                      "amount": 8.0,
                      "unitShort": "oz",
                      "unitLong": "ounces"
                  },
                  "metric": {
                      "amount": 226.796,
                      "unitShort": "g",
                      "unitLong": "grams"
                  }
              }
          },
          {
              "id": 11529,
              "aisle": "Produce",
              "image": "tomato.png",
              "consistency": "SOLID",
              "name": "tomatoes",
              "nameClean": "tomato",
              "original": "1 + ½ cup diced tomatoes, seeds removed",
              "originalName": "diced tomatoes, seeds removed",
              "amount": 1.5,
              "unit": "cup",
              "meta": [
                  "diced",
                  "seeds removed"
              ],
              "measures": {
                  "us": {
                      "amount": 1.5,
                      "unitShort": "cups",
                      "unitLong": "cups"
                  },
                  "metric": {
                      "amount": 354.882,
                      "unitShort": "ml",
                      "unitLong": "milliliters"
                  }
              }
          },
          {
              "id": 1040,
              "aisle": "Cheese",
              "image": "Swiss-cheese.jpg",
              "consistency": "SOLID",
              "name": "swiss cheese",
              "nameClean": "swiss cheese",
              "original": "1 cup cubed Swiss cheese",
              "originalName": "cubed Swiss cheese",
              "amount": 1.0,
              "unit": "cup",
              "meta": [
                  "cubed"
              ],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "cup",
                      "unitLong": "cup"
                  },
                  "metric": {
                      "amount": 236.588,
                      "unitShort": "ml",
                      "unitLong": "milliliters"
                  }
              }
          },
          {
              "id": 10011282,
              "aisle": "Produce",
              "image": "red-onion.png",
              "consistency": "SOLID",
              "name": "onions",
              "nameClean": "red onion",
              "original": "½ cup thinly sliced red onions",
              "originalName": "thinly sliced red onions",
              "amount": 0.5,
              "unit": "cup",
              "meta": [
                  "red",
                  "thinly sliced"
              ],
              "measures": {
                  "us": {
                      "amount": 0.5,
                      "unitShort": "cups",
                      "unitLong": "cups"
                  },
                  "metric": {
                      "amount": 118.294,
                      "unitShort": "ml",
                      "unitLong": "milliliters"
                  }
              }
          },
          {
              "id": 10123,
              "aisle": "Meat",
              "image": "raw-bacon.png",
              "consistency": "SOLID",
              "name": "bacon",
              "nameClean": "applewood smoked bacon",
              "original": "1 pound bacon, cooked crispy and chopped",
              "originalName": "bacon, cooked crispy and chopped",
              "amount": 1.0,
              "unit": "pound",
              "meta": [
                  "crispy",
                  "cooked",
                  "chopped"
              ],
              "measures": {
                  "us": {
                      "amount": 1.0,
                      "unitShort": "lb",
                      "unitLong": "pound"
                  },
                  "metric": {
                      "amount": 453.592,
                      "unitShort": "g",
                      "unitLong": "grams"
                  }
              }
          },
          {
              "id": 11252,
              "aisle": "Produce",
              "image": "iceberg-lettuce.jpg",
              "consistency": "SOLID",
              "name": "iceberg lettuce",
              "nameClean": "lettuce",
              "original": "2 cups finely chopped romaine or iceberg lettuce",
              "originalName": "finely chopped romaine or iceberg lettuce",
              "amount": 2.0,
              "unit": "cups",
              "meta": [
                  "finely chopped"
              ],
              "measures": {
                  "us": {
                      "amount": 2.0,
                      "unitShort": "cups",
                      "unitLong": "cups"
                  },
                  "metric": {
                      "amount": 473.176,
                      "unitShort": "ml",
                      "unitLong": "milliliters"
                  }
              }
          },
          {
              "id": 1002047,
              "aisle": "Spices and Seasonings",
              "image": "salt.jpg",
              "consistency": "SOLID",
              "name": "coarse salt and pepper",
              "nameClean": "coarse salt",
              "original": "coarse salt and fresh black pepper",
              "originalName": "coarse salt and fresh black pepper",
              "amount": 8.0,
              "unit": "servings",
              "meta": [
                  "fresh",
                  "black"
              ],
              "measures": {
                  "us": {
                      "amount": 8.0,
                      "unitShort": "servings",
                      "unitLong": "servings"
                  },
                  "metric": {
                      "amount": 8.0,
                      "unitShort": "servings",
                      "unitLong": "servings"
                  }
              }
          }
      ],
      "id": 491786,
      "title": "Ranch BLT Pasta Salad",
      "readyInMinutes": 45,
      "servings": 8,
      "sourceUrl": "https://www.cinnamonspiceandeverythingnice.com/ranch-blt-pasta-salad/",
      "image": "https://spoonacular.com/recipeImages/491786-556x370.jpg",
      "imageType": "jpg",
      "summary": "Ranch BLT Pasta Salad takes about <b>45 minutes</b> from beginning to end. This recipe serves 8. For <b>$1.38 per serving</b>, this recipe <b>covers 12%</b> of your daily requirements of vitamins and minerals. One serving contains <b>474 calories</b>, <b>15g of protein</b>, and <b>33g of fat</b>. 32767 people were impressed by this recipe. It works well as a main course. Head to the store and pick up bacon, iceberg lettuce, tomatoes, and a few other things to make it today. It is brought to you by Cinnamon Spice and Everything Nice. Overall, this recipe earns a <b>pretty good spoonacular score of 57%</b>. Similar recipes are <a href=\"https://spoonacular.com/recipes/ranch-blt-pasta-salad-1432117\">Ranch BLT Pasta Salad</a>, <a href=\"https://spoonacular.com/recipes/ranch-blt-pasta-salad-500104\">Ranch BLT Pasta Salad</a>, and <a href=\"https://spoonacular.com/recipes/ranch-blt-pasta-salad-1505757\">Ranch BLT Pasta Salad</a>.",
      "cuisines": [],
      "dishTypes": [
          "side dish",
          "lunch",
          "main course",
          "main dish",
          "dinner"
      ],
      "diets": [],
      "occasions": [],
      "winePairing": {
          "pairedWines": [],
          "pairingText": "",
          "productMatches": []
      },
      "instructions": "Cook the pasta according to package directions to al dente in plenty of salted water.\nDrain pasta, toss with dressing to lightly coat so they don’t stick together and refrigerate until cold.\nIn a large bowl toss the cold pasta with the tomatoes, Swiss, onions, bacon and lettuce.\nAdd enough dressing to generously coat everything and season to taste with salt and pepper.",
      "analyzedInstructions": [
          {
              "name": "",
              "steps": [
                  {
                      "number": 1,
                      "step": "Cook the pasta according to package directions to al dente in plenty of salted water.",
                      "ingredients": [
                          {
                              "id": 20420,
                              "name": "pasta",
                              "localizedName": "pasta",
                              "image": "fusilli.jpg"
                          },
                          {
                              "id": 14412,
                              "name": "water",
                              "localizedName": "water",
                              "image": "water.png"
                          }
                      ],
                      "equipment": []
                  },
                  {
                      "number": 2,
                      "step": "Drain pasta, toss with dressing to lightly coat so they don’t stick together and refrigerate until cold.",
                      "ingredients": [
                          {
                              "id": 20420,
                              "name": "pasta",
                              "localizedName": "pasta",
                              "image": "fusilli.jpg"
                          }
                      ],
                      "equipment": []
                  },
                  {
                      "number": 3,
                      "step": "In a large bowl toss the cold pasta with the tomatoes, Swiss, onions, bacon and lettuce.",
                      
                      "ingredients": [
                          {
                              "id": 11529,
                              "name": "tomato",
                              "localizedName": "tomato",
                              "image": "tomato.png"
                          },
                          {
                              "id": 11252,
                              "name": "lettuce",
                              "localizedName": "lettuce",
                              "image": "iceberg-lettuce.jpg"
                          },
                          {
                              "id": 11282,
                              "name": "onion",
                              "localizedName": "onion",
                              "image": "brown-onion.png"
                          },
                          {
                              "id": 10123,
                              "name": "bacon",
                              "localizedName": "bacon",
                              "image": "raw-bacon.png"
                          },
                          {
                              "id": 20420,
                              "name": "pasta",
                              "localizedName": "pasta",
                              "image": "fusilli.jpg"
                          }
                      ],
                      "equipment": [
                          {
                              "id": 404783,
                              "name": "bowl",
                              "localizedName": "bowl",
                              "image": "bowl.jpg"
                          }
                      ]
                  },
                  {
                      "number": 4,
                      "step": "Add enough dressing to generously coat everything and season to taste with salt and pepper.",
                      "ingredients": [
                          {
                              "id": 1102047,
                              "name": "salt and pepper",
                              "localizedName": "salt and pepper",
                              "image": "salt-and-pepper.jpg"
                          }
                      ],
                      "equipment": []
                  }
              ]
          }
      ],
    }
    @recipe = Recipe.new(recipe1)
    current_user = {"google_id"=>"100378230956154024998",
      "name"=>"Dawson Timmons",
      "email"=>"dawsontimmons@gmail.com",
      "intolerances"=>nil,
      "likes"=>nil,
      "dislikes"=>nil,
      "dietary_restrictions"=>nil
    }
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
    data = {:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"dawsontimmons@gmail.com", :name=>"Dawson Timmons", :google_id=>"100378230956154024998", :id=>5, :intolerances=>nil, :likes=>nil, :dislikes=>nil, :dietary_restrictions=>nil}}}
    @user = User.new(data)
    allow(UserFacade).to receive(:find_user_by_google_id).with(current_user["google_id"]).and_return(@user)
    end
  
    it "when I visit '/meals/:id' I see the recipe details" do
      VCR.use_cassette('search_recipe1_id') do
        visit "/meals/#{@recipe.spoonacular_id}"
        expect(current_path).to eq("/meals/#{@recipe.spoonacular_id}")
        expect(page).to have_content("Ranch BLT Pasta Salad")
        expect(page).to have_content("Ingredients")
        expect(page).to have_content("Instructions")
        expect(page).to have_content("Estimated Cooking Time: #{@recipe.cook_time} Minutes")
      end
    end
    
    it "I should see a link to add the recipe to my day plan" do
      VCR.use_cassette('search_recipe2_id') do        
        visit "/meals/#{@recipe.spoonacular_id}"
        expect(page).to have_button("Add to My Meal Plan")
      end
    end

    it "I should see a dropdown that allows me to select a new recipe" do
      VCR.use_cassette('search_recipe3_id') do
        visit "/meals/#{@recipe.spoonacular_id}"
          expect(page).to have_button("Generate New Breakfast Recipe")
          expect(page).to have_button("Generate New Lunch Recipe")
          expect(page).to have_button("Generate New Dinner Recipe")
      end
    end
  end
end