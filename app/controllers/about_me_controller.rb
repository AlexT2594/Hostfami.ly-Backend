class AboutMeController < ApplicationController
  before_action :authenticate_request!
  def create
    if @current_user.student?
    	@student = @current_user
    	@student.about_me = Student::AboutMe.new(student_params)

    	if @student.about_me.save
    		render json: { result: "Successful" }
      else
        render json: { errors: @student.about_me.errors.full_messages }
      end
    else
      render json: { error: "Unknown user" }
    end
  end

  def show
    if @current_user.student?
      render json: { about_me: @current_user.about_me }
    else
      render json: { error: "only students have about me" }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { about_me: u.about_me}
    else
      render json: { error: "Unauthorized"}
    end
  end

  private
    def student_params
      params.require(:user).permit(:gender, :weight, :height, :tell, :cell, :religion, :tutor_email, :religion_celebrations)
    end
end
