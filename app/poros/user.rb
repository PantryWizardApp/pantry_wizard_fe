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
    @google_id = data[:data][:attributes][:google_id]
    @name = data[:data][:attributes][:name]
    @email = data[:data][:attributes][:email]
    @intolerances = data[:data][:attributes][:intolerances]
    @likes = data[:data][:attributes][:likes]
    @dislikes = data[:data][:attributes][:dislikes]
    @dietary_restrictions = data[:data][:attributes][:dietary_restrictions]
  end

  def self.raw_google_data(data)
    {
      google_id: data[:data][:attributes][:google_id],
      name: data[:data][:attributes][:name],
      email: data[:data][:attributes][:email],
    }
  end
end