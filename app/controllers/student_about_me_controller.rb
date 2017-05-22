class StudentAboutMeController < ApplicationController
  before_filter :authenticate_request!

  def create
  	@student = @current_user
  	@student.about_me = Student::AboutMe.new(user_params)

  	if @student.about_me.save
  		render json: {erros: "Successful"}
    else
      render json: { errors: "User not found" }
    end

  end

  private
    def user_params
      params.require(:user).permit(:gender, :weight, :height, :tell,:cell, :religion, :tutor_email, :religion_celebrations)
    end
end
