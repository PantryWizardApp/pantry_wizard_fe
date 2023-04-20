require "rails_helper" 

describe "User dashboard page" do 
  before :each do 
    @json_response = File.read('spec/fixtures/user.json')
  end
  it "will deny access to an unathorized user" do 
    stub_request(:get, "http://localhost:5000/api/v1/users/")
      .to_return(status: 200, body: @json_response)
    
    visit "/dashboard"

    expect(page).to have_content("You must be logged in to access this page")
  end
  context "authorized user dashboard - no meal plans" do
    before do
      current_user = {"google_id"=>"100378230956154024998",
      "name"=>"Dawson Timmons",
      "email"=>"dawsontimmons@gmail.com",
      "intolerances"=>nil,
      "likes"=>nil,
      "dislikes"=>nil,
      "dietary_restrictions"=>nil}
  
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  
      data = {:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"dawsontimmons@gmail.com", :name=>"Dawson Timmons", :google_id=>"100378230956154024998", :id=>5, :intolerances=>nil, :likes=>nil, :dislikes=>nil, :dietary_restrictions=>nil}}}
      user = User.new(data)
      allow(UserFacade).to receive(:find_user_by_google_id).with(current_user["google_id"]).and_return(user)
    end
    it "will allow an authorized user to visit the page" do 
      VCR.use_cassette('user_dashboard_return') do
        visit '/dashboard'
        expect(current_path).to eq('/dashboard')
      end
    end
    it "has the welcome message with the current users name and today's date" do
      VCR.use_cassette('user_dashboard_return') do
        visit '/dashboard'
        expect(page).to have_content("Today's Date: Thursday, April 20, 2023")
        expect(page).to have_content("Welcome Dawson Timmons!")
        expect(page).to have_content("You do not currently have any active meal plans. Please select “Create New Meal Plan” to get started!")
      end
    end
    describe "the dashboard buttons" do
      it "has a button to create a meal plan" do
        VCR.use_cassette('user_dashboard_return') do
          visit '/dashboard'
          expect(page).to have_link("Create New Meal Plan")
          click_link "Create New Meal Plan"
          expect(current_path).to eq("/create_meal_plan")
        end
      end
      it "has a button to edit the user preferences" do
        VCR.use_cassette('user_dashboard_return') do
          visit '/dashboard'
          expect(page).to have_link("Edit My Preferences")
          click_link "Edit My Preferences"
          expect(current_path).to eq("/preferences")
        end
      end
    end
  end
  context "authorized user dashboard - upcoming meal plans" do
    before do
      current_user = {"google_id"=>"100378230956154024998",
      "name"=>"Dawson Timmons",
      "email"=>"dawsontimmons@gmail.com",
      "intolerances"=>nil,
      "likes"=>nil,
      "dislikes"=>nil,
      "dietary_restrictions"=>nil}
  
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  
      data = {:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"dawsontimmons@gmail.com", :name=>"Dawson Timmons", :google_id=>"100378230956154024998", :id=>5, :intolerances=>nil, :likes=>nil, :dislikes=>nil, :dietary_restrictions=>nil}}}
      user = User.new(data)
      allow(UserFacade).to receive(:find_user_by_google_id).with(current_user["google_id"]).and_return(user)
      day_plan = {:data=>{:id=>"21", :type=>"day_plan", :attributes=>{:user_id=>5, :date=>"2023-04-21", :recipes=>[]}}}
      allow(DayPlanService).to receive(:create_user_day_plan).with(user.id, day_plan).and_return(day_plan)
      recipe_1 = {:data=>{:id=>"20", :type=>"recipe", :attributes=>{:spoonacular_id=>1234215343, :name=>"oatmeal", :ingredients=>"oats, water", :instructions=>"idk mannn, JUST THROw IT IN THE WATER", :image=>"https://spoonacular.com/recipeImages/595736-556x370.jpg", :day_plan_id=>20}}}
      recipe_2 = {:data=>{:id=>"21", :type=>"recipe", :attributes=>{:spoonacular_id=>1234215353, :name=>"noodles", :ingredients=>"noodles, water", :instructions=>"idk mannn, JUST THROw IT IN THE WATER", :image=>"https://spoonacular.com/recipeImages/595736-556x370.jpg", :day_plan_id=>20}}}
      recipe_3 = {:data=>{:id=>"22", :type=>"recipe", :attributes=>{:spoonacular_id=>1234215363, :name=>"spaghetti", :ingredients=>"spaghetti, water", :instructions=>"idk mannn, JUST THROw IT IN THE WATER", :image=>"https://spoonacular.com/recipeImages/595736-556x370.jpg", :day_plan_id=>20}}}
      allow(LocalRecipeService).to receive(:create_recipe).with(recipe_1).and_return(recipe_1)
      allow(LocalRecipeService).to receive(:create_recipe).with(recipe_2).and_return(recipe_2)
      allow(LocalRecipeService).to receive(:create_recipe).with(recipe_3).and_return(recipe_3)
    end
    it "lists the upcoming meal plan with the corresponding dashboard message" do
      VCR.use_cassette('user_dashboard_return_upcoming_meal_plan') do
        visit "/dashboard"
        expect(current_path).to eq("/dashboard")
        expect(page).to have_content("You do not have any active meal plans today! If you would like to create one, please select “Create New Meal Plan” to get started!")
        expect(page).to have_content("My Upcoming Meal Plans:")
        expect(page).to have_content("Meal Plan for: 2023-04-21")
        expect(page).to have_content("Meal 1: oatmeal")
        expect(page).to have_content("Meal 2: noodles")
        expect(page).to have_content("Meal 3: spaghetti")
      end
    end
  end
  context "authorized user dashboard - today's meal plan" do
    before do
      current_user = {"google_id"=>"100378230956154024998",
      "name"=>"Dawson Timmons",
      "email"=>"dawsontimmons@gmail.com",
      "intolerances"=>nil,
      "likes"=>nil,
      "dislikes"=>nil,
      "dietary_restrictions"=>nil}
  
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)
  
      data = {:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"dawsontimmons@gmail.com", :name=>"Dawson Timmons", :google_id=>"100378230956154024998", :id=>5, :intolerances=>nil, :likes=>nil, :dislikes=>nil, :dietary_restrictions=>nil}}}
      user = User.new(data)
      allow(UserFacade).to receive(:find_user_by_google_id).with(current_user["google_id"]).and_return(user)
      day_plan = {:data=>{:id=>"22", :type=>"day_plan", :attributes=>{:user_id=>5, :date=>"2023-04-20", :recipes=>[]}}}
      allow(DayPlanService).to receive(:create_user_day_plan).with(user.id, day_plan).and_return(day_plan)
      recipe_1 = {:data=>{:id=>"20", :type=>"recipe", :attributes=>{:spoonacular_id=>1234215343, :name=>"oatmeal", :ingredients=>"oats, water", :instructions=>"idk mannn, JUST THROw IT IN THE WATER", :image=>"https://spoonacular.com/recipeImages/595736-556x370.jpg", :day_plan_id=>22}}}
      recipe_2 = {:data=>{:id=>"21", :type=>"recipe", :attributes=>{:spoonacular_id=>1234215353, :name=>"noodles", :ingredients=>"noodles, water", :instructions=>"idk mannn, JUST THROw IT IN THE WATER", :image=>"https://spoonacular.com/recipeImages/595736-556x370.jpg", :day_plan_id=>22}}}
      recipe_3 = {:data=>{:id=>"22", :type=>"recipe", :attributes=>{:spoonacular_id=>1234215363, :name=>"spaghetti", :ingredients=>"spaghetti, water", :instructions=>"idk mannn, JUST THROw IT IN THE WATER", :image=>"https://spoonacular.com/recipeImages/595736-556x370.jpg", :day_plan_id=>22}}}
      allow(LocalRecipeService).to receive(:create_recipe).with(recipe_1).and_return(recipe_1)
      allow(LocalRecipeService).to receive(:create_recipe).with(recipe_2).and_return(recipe_2)
      allow(LocalRecipeService).to receive(:create_recipe).with(recipe_3).and_return(recipe_3)
    end
    it "returns the correct message" do
      VCR.use_cassette('user_dashboard_return_today_meal_plan') do
        visit "/dashboard"
        expect(current_path).to eq("/dashboard")
        expect(page).to have_content("Here's your selected meal plan for today:")
        expect(page).to_not have_content("You do not have any active meal plans today! If you would like to create one, please select “Create New Meal Plan” to get started!")
        expect(page).to_not have_content("You do not currently have any active meal plans. Please select “Create New Meal Plan” to get started!")
      end
    end
    it "lists today's meal plan" do
      VCR.use_cassette('user_dashboard_return_today_meal_plan') do
        visit "/dashboard"
        expect(current_path).to eq("/dashboard")
        expect(page).to have_content("Here's your selected meal plan for today:")
        expect(page).to have_link("oatmeal")
        expect(page).to have_link("noodles")
        expect(page).to have_link("spaghetti")
        expect(page).to have_css("img[src='https://spoonacular.com/recipeImages/595736-556x370.jpg']")
      end
    end
    it "no longer has the upcoming meal plan" do
      VCR.use_cassette('user_dashboard_return_today_meal_plan') do
        visit "/dashboard"
        expect(current_path).to eq("/dashboard")
        expect(page).to_not have_content("Meal Plan for: 2023-04-21")
        expect(page).to_not have_content("Meal 1: oatmeal")
        expect(page).to_not have_content("Meal 2: noodles")
        expect(page).to_not have_content("Meal 3: spaghetti")
      end
    end
  end
end