class AuthenticationController < ApplicationController
  def authenticate_user
    user = User.find_by(email: params[:email])
    if user and user.email_confirmed and user.authenticate(params[:password])
      render json: {
            auth_token: JsonWebToken.encode({user_id: user.id}),
            user: {id: user.id, email: user.email}
          }
    elsif user and !user.email_confirmed and user.authenticate(params[:password])
      render json: {
        error: "The email wasn't confirmed",
        link: "http://localhost:3100/confirm_email?" + user.confirm_token
      }
    else
      render json: {error: 'Invalid Username/Password'}
    end
  end
end
