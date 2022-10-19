class ApplicationController < ActionController::API

  def encode_token(payload)
    JWT.encode(payload, 'petyr-plet-plete-prez-tri-pryta-preplita')
  end

  def auth_header
    request.headers['Autorization']
  end

  def decode_token
    if auth_header
      token = auth_header.split(' ').last if auth_header
      
      begin
        JWT.decode(token, 'petyr-plet-plete-prez-tri-pryta-preplita',
          true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
  
      end
    end
  end

  def current_user
    if decode_token
      user_id = decode_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    unless logged_in?
      render json: { message: 'Please log in' }, status: :unauthorized
    end
  end
end
