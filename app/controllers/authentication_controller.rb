class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def login
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      render json: command.result
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def signup
    @user = User.create!(signup_params)
    render json: @user
  end

  def signup_params
    params.require(:authentication).permit(:username, :email, :password, :password_confirmation)
  end
end
