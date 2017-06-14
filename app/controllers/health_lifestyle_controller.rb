class HealthLifestyleController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      @student = @current_user
      @student.health_lifestyle = Student::HealthLifestyle.new(student_params)

      if @student.health_lifestyle.save
        render json: { result: "Successful" }
      else
        render json: { error: "User not found" }
      end
    else
      render json: { error: "Unknown user" }
    end
  end

  def show
    if @current_user.student?
      render json: { health_lifestyle: @current_user.health_lifestyle }
    else
      render json: { error: "only students have health_lifestyle" }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { about_me: u.health_lifestyle}
    else
      render json: { error: "Unauthorized"}
    end
  end

  private
    def student_params
      params.require(:user).permit(:allergies, :handicaps, :pets, :diet, :smoking)
    end
end
