require "rails_helper"

RSpec.describe User do 
  it "will exist and have attributes" do 
    user = User.new(response = 
      {
        username: "Brian", 
        uid: 2,
        email: "brian123@gmail.com", 
        password: "1234", 
        intolerances: "gluten", 
        likes: "pizza",
        dietary_restrictions: "dairy"
      })

      expect(user.username).to eq("Brian")
      expect(user.email).to eq("brian123@gmail.com")
      expect(user.intolerances).to eq("gluten")
      expect(user.likes).to eq("pizza")
      expect(user.dietary_restrictions).to eq("dairy")
  end
end