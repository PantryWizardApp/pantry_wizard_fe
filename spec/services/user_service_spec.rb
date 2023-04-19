require "rails_helper"

RSpec.describe UserService do 
  before :each do 
    user = File.read("spec/fixtures/user.json")
    stub_request(:get, "http://localhost:5000/api/v1/users/1234567890a") 
      .to_return(status: 200, body: user)

    # new_user = {email: "bh1200@gmail.com", name: "Bob", google_id: "12345"}
  
  end
  it "can get a user by google id" do 
    user = UserService.user("1234567890a")
    
    expect(user[:data][:id]).to eq("1234567890a")
    expect(user[:data][:attributes][:email]).to eq("bh@gmail.com")
    expect(user[:data][:attributes][:name]).to eq("Brian")
    expect(user[:data][:attributes][:google_id]).to eq("1234567890a")
    expect(user[:data][:attributes][:intolerances]).to eq("dairy, gluten")
    expect(user[:data][:attributes][:likes]).to eq(nil)
    expect(user[:data][:attributes][:dislikes]).to eq(nil)
    expect(user[:data][:attributes][:dietary_restrictions]).to eq("vegan")
  end

  it 'can create a new user' do
    user = {email: "test@gmail.com", name: "Bob", google_id: "12345"}

    user_creation = UserService.create_user(user)

    expect(user_creation[:data][:attributes][:email]).to eq("test@gmail.com")
    expect(user_creation[:data][:attributes][:name]).to eq("Bob")
    expect(user_creation[:data][:attributes][:google_id]).to eq("12345")
  end
end