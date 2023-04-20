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
    current_user = {"google_id"=>"106048413854356122337",
    "name"=>"Conner Van Loan",
    "email"=>"cdvanloan@gmail.com",
    "intolerances"=>nil,
    "likes"=>nil,
    "dislikes"=>nil,
    "dietary_restrictions"=>nil}

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(current_user)

    data = {:data=>{:id=>"5", :type=>"user", :attributes=>{:email=>"cdvanloan@gmail.com", :name=>"Conner Van Loans", :google_id=>"106048413854356122337", :id=>5, :intolerances=>nil, :likes=>nil, :dislikes=>nil, :dietary_restrictions=>nil}}}
    user = User.new(data)
    allow(UserFacade).to receive(:find_user_by_google_id).with(current_user["google_id"]).and_return(user)

    VCR.use_cassette('user_dashboard_return') do
      visit '/dashboard'
      expect(current_path).to eq('/dashboard')
    end
  end
end