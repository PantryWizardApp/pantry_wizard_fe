class UserFacade
  def self.create_user(data)
    UserService.create_new_user(data)
  end


  def self.find_user_by_google_id(google_id)
   user = UserService.user(google_id)
   User.new(user)
  end 
end