class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    authenticate(params[:email], params[:password])
  end

  def signup
    @user = User.create!(signup_params)
    authenticate(params[:email], params[:password])
  end

  private

  def authenticate(email, password)
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: command.result
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def signup_params
    params.require(:authentication).permit(:username, :email, :password, :password_confirmation)
  end
end
