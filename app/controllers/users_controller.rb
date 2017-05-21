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
      UserAuthMailer.send_confirmation_email(@user).deliver_later
      #deliver_later will still be slow since there is no backend for jobs as delayed job or sidekiq

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

  def confirm_email
    user = User.find_by_confirm_token(params[:tk])
    if user
      user.email_activate
      render json: { result: "success" }
    else
      render json: { result: "error" }
    end
  end

  private
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end

end
