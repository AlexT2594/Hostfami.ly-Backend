class AboutMeController < ApplicationController
  before_filter :authenticate_request!

  def create
    if @current_user.student?
    	@student = @current_user
    	@student.about_me = Student::AboutMe.new(student_params)

    	if @student.about_me.save
    		render json: { result: "Successful" }
      else
        render json: { error: "User not found" }
      end
    else
      render json: { error: "Unknown user" }
    end
  end

  private
    def student_params
      params.require(:user).permit(:gender, :weight, :height, :tell, :cell, :religion, :tutor_email, :religion_celebrations)
    end
end
