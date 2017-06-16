class AboutMeController < ApplicationController
  before_action :authenticate_request!
  def create
    if @current_user.student?
    	abm = Student::AboutMe.new(student_params)
      abm.student_id = @current_user.id

    	if abm.valid?
        @current_user.about_me = abm
    		render json: { result: "Successful" }
      else
        render json: { errors: abm.errors.full_messages }
      end
    else
      render json: { errors: ["Unknown user"] }
    end
  end

  def show
    if @current_user.student?
      render json: { about_me: @current_user.about_me }
    else
      render json: { errors: ["only students have about me"] }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { about_me: u.about_me}
    else
      render json: { errors: ["Unauthorized"]}
    end
  end

  private
    def student_params
      params.require(:user).permit(:gender, :weight, :height, :tell, :cell, :religion, :tutor_email, :religion_celebrations)
    end
end
