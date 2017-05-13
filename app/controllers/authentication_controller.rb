class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      render json: {
            auth_token: JsonWebToken.encode({user_id: user.id}),
            user: {id: user.id, email: user.email}
          }
    else
      render json: {errors: ['Invalid Username/Password']}, status: :unauthorized
    end
  end
end
