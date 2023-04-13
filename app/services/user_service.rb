class UserService

  def self.user(google_id)
    JSON.pars(conn.get("users/#{google_id}"))
  end

  def self.create_new_user
    
  end
  private 
  
  def conn 
    Faraday.new(url: "http://localhost:3000/api/v1")
  end
end