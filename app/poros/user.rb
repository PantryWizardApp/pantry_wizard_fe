class User 
  attr_reader :id,
              :google_id,
              :name, 
              :email, 
              :intolerances, 
              :likes, 
              :dislikes,
              :dietary_restrictions

  def initialize(data)
    @google_id = data[:uid]
    @name = data[:name]
    @email = data[:email]
    @intolerances = data[:intolerances]
    @likes = data[:likes]
    @dislikes = data[:dislikes]
    @dietary_restrictions = data[:dietary_restrictions]
  end

  def self.raw_google_data(data)
    {
      google_id: data[:uid],
      name: data[:info][:name],
      email: data[:info][:email],
    }
  end
end