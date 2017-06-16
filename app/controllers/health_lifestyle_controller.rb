class HealthLifestyleController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      @current_user.health_lifestyle = Student::HealthLifestyle.new(user_params)
      render json: { result: "Successful" }
    elsif @current_user.family?
      @current_user.health_lifestyle = Family::HealthLifestyle.new(user_params)
      render json: { result: "Successful" }
    else
      render json: { errors: ["User not found"] }
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
      render json: { health_lifestyle: u.health_lifestyle}
    else
      render json: { error: "Unauthorized"}
    end
  end

  private
    def user_params
      params.require(:user).permit(:allergies, :handicaps, :pets, :diet, :smoking)
    end
end
