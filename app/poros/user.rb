class User 
  attr_reader :id,
              :google_id,
              :username, 
              :email, 
              :intolerances, 
              :likes, 
              :dislikes,
              :dietary_restrictions

  def initialize(data)
    @google_id = [:uid]
    @username = [:username]
    @email = [:email]
    @intolerances = [:intolerances]
    @likes = [:likes]
    @dislikees = [:dislikes]
    @dietary_restrictions = [:dietary_restrictions]
  end

  def self.raw_google_data(data)
    {
      google_id: data[:uid],
      username: data[:info][:name],
      email: data[:info][:email],
    }
  end
end