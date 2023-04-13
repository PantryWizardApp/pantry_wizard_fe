require "rails_helper"

RSpec.describe User do 
  before :each do 
    @user = User.new(response = 
    {
      username: "Brian", 
      uid: 2,
      email: "brian123@gmail.com", 
      password: "1234", 
      intolerances: "gluten", 
      likes: "pizza",
      dietary_restrictions: "dairy"
    })
  end 

  it "will exist and have attributes" do 

      expect(@user.username).to eq("Brian")
      expect(@user.email).to eq("brian123@gmail.com")
      expect(@user.intolerances).to eq("gluten")
      expect(@user.likes).to eq("pizza")
      expect(@user.dietary_restrictions).to eq("dairy")
  end

  it "will have raw data method" do 
    expect(@user.raw_data[:uid]).to eq(2)
    expect(@user.raw_data[:username]).to eq("Brian")
    expect(@user.raw_data[:intolerances]).to eq("gluten")
    expect(@user.raw_data[:likes]).to eq("pizza")
    expect(@user.raw_data[:dietary_restrictions]).to eq("dairy")

  end
end