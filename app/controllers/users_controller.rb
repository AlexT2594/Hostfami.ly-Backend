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
    utype = get_utype
    if(utype == "student")
      @user = Student.new(user_params)
    elsif(utype == "family")
      @user = Family.new(user_params)
    else
      @user = Volunteer.new(user_params)
    end

    if @user.save

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
    def get_utype
      params.require(:user).permit(:utype)[:utype]
    end
    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :email_confirmation,:password, :password_confirmation, :birthday, :state, :city, :address)
    end

end
