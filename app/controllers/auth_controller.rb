class AuthController < ApplicationController
  skip_before_action :authorize, only: [:login]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def login
    @user = User.find_by!(login: login_params[:login])

    if @user.authenticate(login_params[:password])

      token = encode_token(user_id: @user.id)
      render json: {
        user: UserSerializer.new(@user),
        token: token
      }, status: :accepted
    else
      render json: {message: 'Invalid user/password combination'}, status: :unauthorized
    end

  end

  # def logout
  #  # should be implemented
  # end

  def get_auth_user
    render json: {
      user: UserSerializer.new(@user)
    }, status: :ok
  end

  private

  def login_params
    params.permit(:login, :password)
  end

  def handle_record_not_found
    render json: { message: "User doesn't exist" }, status: :unauthorized
  end
end