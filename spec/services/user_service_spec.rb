require "rails_helper"

RSpec.describe UserService do 
  it "can get a user by google id" do 
    VCR.use_cassette("user_service_user") do
      @user = UserService.user("1234567890a")
    end

    expect(@user[:data][:id]).to eq("1")
    expect(@user[:data][:attributes][:email]).to eq("bh@gmail.com")
    expect(@user[:data][:attributes][:name]).to eq("Brian")
    expect(@user[:data][:attributes][:google_id]).to eq("1234567890a")
    expect(@user[:data][:attributes][:intolerances]).to eq("dairy, gluten")
    expect(@user[:data][:attributes][:likes]).to eq(nil)
    expect(@user[:data][:attributes][:dislikes]).to eq(nil)
    expect(@user[:data][:attributes][:dietary_restrictions]).to eq("vegan")
  end

  it 'can create a new user' do
    @user = {email: "test@gmail.com", name: "Bob", google_id: "12345"}
    VCR.use_cassette("user_service_create_new_user") do
      response = UserService.create_new_user(@user)
      @user_creation = JSON.parse(response.body, symbolize_names: true)
    end
    
    expect(@user_creation[:data][:attributes][:email]).to eq("test@gmail.com")
    expect(@user_creation[:data][:attributes][:name]).to eq("Bob")
    expect(@user_creation[:data][:attributes][:google_id]).to eq("12345")
  end
end