require "rails_helper"

RSpec.describe "Welcome Page" do
  describe "as a visitor" do
    it "When I visit '/' I see an about Pantry Wizard Statement" do
      visit "/"
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to Pantry Wizard")
      expect(page).to have_css("img.img-fluid")
      expect(page).to have_css('img[alt="logo"]')
      expect(page).to have_content("At Pantry Wizard, we believe that everyone deserves access to healthy, delicious food.")
      expect(page).to have_content("We're on a mission to reduce food waste and alleviate food insecurity by providing personalized meal planning that simplifies the decision-making process and empowers individuals to take control of their nutrition.")
      expect(page).to have_content("Our app is designed to meet the needs of neurodivergent individuals, picky eaters, and anyone facing time or resource constraints, so they can focus on what really matters in their lives. Join us in making a positive impact on our communities, one meal at a time.")
    end

    it "Will have a link to login" do 
      visit "/"

      expect(page).to have_link("Log in with Google")
    end
  end
end