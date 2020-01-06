class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    if user
      auth_token = JsonWebToken.encode(user_id: user.id) if user
      return {
        auth_token: auth_token,
        user: user.as_json
      }
    else
      raise 'Auth failed'
    end
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end
