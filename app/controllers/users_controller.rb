class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.valid?
      payload = {user_id: user.id}
      token = encode_token(payload)
      render json: {user: user, jwt: token}
    else
      render json: { errors: user.errors.full_message}, status: :not_acceptable
    end
  end

  private
  
  def user_params
    params.permit(:username, :password)
  end
end
