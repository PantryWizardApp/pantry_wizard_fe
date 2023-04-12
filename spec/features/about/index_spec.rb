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
  end
end