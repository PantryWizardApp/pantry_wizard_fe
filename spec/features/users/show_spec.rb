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

  it "will allow an authorized user to visit the page" do 
    @user = User.new({data:{attributes:{email: "bh1200@gmail.com", name: "Bob", google_id: "1234567890a"}}})
    stub_request(:get, "http://localhost:5000/api/v1/users/#{@user.google_id}")
      .to_return(status: 200, body: @json_response)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit "/dashboard"

    expect(current_path).to eq("/dashboard")
  end
end