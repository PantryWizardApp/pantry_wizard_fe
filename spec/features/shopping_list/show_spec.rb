require "rails_helper"

RSpec.describe "shopping list show" do 
  it "will have a map" do 

    @user = User.new({data:{attributes:{email: "bh1200@gmail.com", name: "Bob", google_id: "1234567890a"}}})
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit shopping_list_path
 save_and_open_page
    expect(page).to have_content("Search for grocery stores near you")
  end
end