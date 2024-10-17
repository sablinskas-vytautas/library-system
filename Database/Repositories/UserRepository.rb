require_relative '../Entities/User'

class UserRepository
  def all
    User.all
  end

  def find(username)
    User.find_by(username: username)
  end

  def create(user_attributes)
    user = find(user_attributes[:username])
    return false if user

    new_user = User.new(user_attributes)
    new_user.save
  end

  def update(username, user_attributes)
    user = find(username)
    user ? user.update(user_attributes) : false
  end

  def delete(username)
    user = find(username)
    user ? user.destroy : false
  end
end