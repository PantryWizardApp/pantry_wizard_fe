class UserService

  def self.user(google_id)
    response = conn.get("/api/v1/users/#{google_id}")
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def self.create_new_user(user)
    response = conn.post("api/v1/users", user)
  end

  def self.update_user(user, preferences_params)
    response = conn.patch("api/v1/users/#{user.id}", preferences_params)
  end

  private 
  
  def self.conn 
    Faraday.new(url: "http://localhost:4000")
  end
end