class AuthController < ApplicationController
  before_action :require_login

  def login
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      payload = { user_id: user.id}
      token = encode_token(payload)
      render json: {user: user, jwt: token, success: "Wlcome back, #{user.username}"}
    else
      render json: {failure: "log in failed! Username or password invalid!"}
    end
  end

  def auto_login
    if session_user
      render json: session_user
    else
      render json: {errors: "no user logged in"}
    end
  end

  def user_is_authed
    
  end

  def loogged_in?
    !!session_user
  end
  
  def require_login
    render json: { message: 'Please login' }, status: unautherized unless logged_in?
  end
end
