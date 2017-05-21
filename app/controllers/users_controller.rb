class UsersController < ApplicationController
  #before_filter :authenticate_request!, :only => :show
  def show
    if User.exists?(params[:id])
      @user = User.find(params[:id])
      render json: @user
    else
      render json: { errors: "User not found" }
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save

      # Sends email to user when user is created.
      #UserCreatedMailer.send_confirmation_email(@user).deliver

      render json: @user
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }
    end
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :email_confirmation,:password, :password_confirmation, :gender)
    end
end
