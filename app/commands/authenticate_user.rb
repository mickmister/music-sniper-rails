class AuthenticateUser
  prepend SimpleCommand

  def initialize(user, valid_user_auth)
    @user = user
    @valid_user_auth = valid_user_auth
  end

  def call
    return invalid_credentials if @valid_user_auth.blank?

    auth_token = JsonWebToken.encode(user_id: user.id)
    { auth_token: auth_token, user: user.safe_attributes }
  end

  private

  attr_accessor :user, :valid_user_auth

  def invalid_credentials
    errors.add :user_authentication, 'invalid credentials'

    raise 'Auth failed'
  end
end
