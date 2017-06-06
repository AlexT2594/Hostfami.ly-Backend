class HealthLifestyleController < ApplicationController
  before_filter :authenticate_request!

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

  private
    def student_params
      params.require(:user).permit(:allergies, :handicaps, :pets, :diet, :smoking)
    end
end
