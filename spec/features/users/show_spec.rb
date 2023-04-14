require "rails_helper" 

describe "User dashboard page" do 
  before :each do 
    @user = {email: "bh1200@gmail.com", name: "Bob", google_id: "12345"}
  end
  it "will deny access to an unathorized user" do 
  
    visit "/dashboard"

    expect(page).to have_content("You must be logged in to access this page")
  end

  it "will allow an authorized user to visit the page" do 
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/dashboard"

    expect(current_path).to eq("/dashboard")
  end
end