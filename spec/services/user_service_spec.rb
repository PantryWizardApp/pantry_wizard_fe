require "rails_helper"

RSpec.describe UserService do 
  before :each do 
    user = File.read("spec/fixtures/user.json")
    stub_request(:get, "http://localhost:3000/api/v1/users/1") 
      .to_return(status: 200, body: user)
  end
  it "can get a user by google id" do 
    expect(response.status).to eq(200)
  end
end