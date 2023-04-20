require 'rails_helper'

RSpec.describe "Day Plan Create Page" do
  before do
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
    VCR.use_cassette('created_meal_plan_dashbaord') do
      visit '/dashboard'
    end
  end

  context 'as a user when I visit the day plan creation page' do 
    it 'shows todays date and info message' do
      expect(current_path).to eq('/dashboard')
      click_link "Create New Meal Plan"
      expect(page).to have_content("Feeling hungry, #{@user.name}?")
      expect(page).to have_content("Today's Date: #{Date.today.strftime("%A, %B %e, %Y")}")
      expect(page).to have_content("Below I have generated a meal plan based on your preferences. Feel free to generate new meals as you see fit!")
    end

    it 'allows the user to select a date for the meal plan' do
      click_link "Create New Meal Plan"
      expect(page).to have_content("Date of meal plan:")
      expect(page).to have_field(:date_of_meal_plan)
      fill_in "date_of_meal_plan", with: "2023-04-22"
      VCR.use_cassette('created_meal_plan') do
        click_button "Create New Meal Plan"
        expect(current_path).to eq("/dashboard")
      end
    end
  end
end