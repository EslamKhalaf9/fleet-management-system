class UserService

  def self.get_user_by_id(id)
    User.find_by(id: id)
  end

  def self.get_user_by_username(username)
    User.find_by(username: username)
  end

  def self.get_user_by_email(email)
    User.find_by(email: email)
  end

  def self.get_all_users
    User.all
  end

  def self.create_user(username, email, password)
    user = User.new(username: username, email: email, password: password)
    user.save
    user
  end
end