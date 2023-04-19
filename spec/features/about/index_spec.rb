require "rails_helper"

RSpec.describe "About Page" do
  describe "as a visitor" do
    it "when I visit '/about' I see an about Pantry Wizard Statement" do
      visit about_path
      expect(current_path).to eq(about_path)
      expect(page).to have_content("About Us")
      expect(page).to have_content("At Pantry Wizard, we believe that everyone deserves access to healthy, delicious food.")
      expect(page).to have_content("Our Team")
    end

    it " I see profile pictures of the team members" do
      visit about_path
      expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/116330317?s=120&v=4']") #Chris
      expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/88596340?s=120&v=4']") #Conner
      expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/104170346?s=120&v=4']")#Caleb
      expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/71752551?s=120&v=4']")#Brian
      expect(page).to have_css("img[src*='https://avatars.githubusercontent.com/u/117066950?s=120&v=4']")#Dawson
    end
  end
end