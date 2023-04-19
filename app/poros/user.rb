class User 
  INTOLERANCES = %w[dairy peanut soy egg seafood sulfite gluten sesame tree_nut grain shellfish wheat].freeze

  attr_reader :id,
              :google_id,
              :name, 
              :email, 
              :intolerances, 
              :likes, 
              :dislikes,
              :dietary_restrictions

  def initialize(data)
    @id = data[:data][:id]
    @google_id = data[:data][:attributes][:google_id]
    @name = data[:data][:attributes][:name]
    @email = data[:data][:attributes][:email]
    @intolerances = data[:data][:attributes][:intolerances] unless data[:data][:attributes][:intolerances].nil?
    @intolerances = [] if data[:data][:attributes][:intolerances].nil?
    @likes = data[:data][:attributes][:likes]
    @dislikes = data[:data][:attributes][:dislikes]
    @dietary_restrictions = data[:data][:attributes][:dietary_restrictions]
  end

  def self.raw_google_data(data)
    require 'pry'; binding.pry
    {
      google_id: data[:uid],
      name: data[:info][:name],
      email: data[:info][:email]
    }
  end
end