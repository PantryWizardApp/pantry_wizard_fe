require "rails_helper"

RSpec.describe "Welcome Page" do
  describe "as a visitor" do
    it "When I visit '/' I see an about Pantry Wizard Statement" do
      visit root_path
      
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome to Pantry Wizard")
      expect(page).to have_css("img.img-fluid")
      expect(page).to have_css('img[alt="logo"]')
    end

    it " I should see a navbar with links to home page and about us" do
      visit root_path
      expect(page).to have_link("Home")
      expect(page).to have_link("About Us")
      click_link "Home"
      expect(current_path).to eq(root_path)
      click_link "About Us"
      expect(current_path).to eq(about_path)
    end

    it "Will have a link to login" do 
      visit root_path

      expect(page).to have_link("Log in with Google")
    end

    it "Will have a link to logout if a user is in session" do
      @user = {email: "bh1200@gmail.com", name: "Bob", google_id: "12345"}
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      require 'pry'; binding.pry
      
      visit root_path
      # save_and_open_page
      expect(page).to have_button("Log Out")
    end
  end
end