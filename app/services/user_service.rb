class UserService

  def self.user(google_id)
    response = conn.get("/api/v1/users/#{google_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_new_user(user)
    conn.post("api/v1/users", user)
  end

  private 
  
  def self.conn 
    Faraday.new(url: "http://localhost:5000")
  end
end