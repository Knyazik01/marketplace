class ApplicationController < ActionController::API
  before_action :authorize

  def encode_token(payload)
    JWT.encode(payload, ENV['JWT_KEY'])
  end

  def decoded_token
    header = request.headers['Authorization']
    if header
      token = header.split(" ")[1]
      begin
        # check algorithm
        JWT.decode(token, ENV['JWT_KEY'], true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def authorize
    unless !!current_user
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end
end
