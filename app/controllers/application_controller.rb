class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, 'my_secret')
  end

  def session_user
    decoded_hash = decoded_token
    if !decode_hash.empty
      user_id = decoded_hash[0]['user_id']
      @user = User.find_by(id: user_id)
    else
      nil
    end
  end

  def auth_header
    request.header['Authorization']
  end

  def decoded_token
    if auth_header
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, 'my-secret', true, algorithm: "HS256")
      rescue JWT::DecodeError
        []
      end
    end
  end
end
