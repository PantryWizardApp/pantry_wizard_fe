require "rails_helper"

RSpec.describe User do 
  before :each do 
   data = {
      name: "Brian", 
      uid: 2,
      email: "brian123@gmail.com", 
      password: "1234", 
      intolerances: "gluten", 
      likes: "pizza",
      dislikes: "beans",
      dietary_restrictions: "dairy"
    }
    @user = User.new(data)

    @data = {
      uid: 2,
    info:
     {
      name: "Brian",
      email: "brian123@gmail.com"
     }
    }
   
  end 

  it "will exist and have attributes" do 
      expect(@user.name).to eq("Brian")
      expect(@user.email).to eq("brian123@gmail.com")
      expect(@user.google_id).to eq(2)
      expect(@user.intolerances).to eq("gluten")
      expect(@user.likes).to eq("pizza")
      expect(@user.dislikes).to eq("beans")
      expect(@user.dietary_restrictions).to eq("dairy")
  end

  it "will have raw data method" do 
    expect(User.raw_google_data(@data)[:google_id]).to eq(2)
    expect(User.raw_google_data(@data)[:name]).to eq("Brian")
    expect(User.raw_google_data(@data)[:email]).to eq("brian123@gmail.com")
  end
end