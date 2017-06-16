class HealthLifestyleController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      hl = Student::HealthLifestyle.new(user_params)
      hl.student_id = @current_user.id
      if hl.valid?
        @current_user.health_lifestyle = hl
        render json: { result: "Successful" }
      else
        render json: {errors: hl.errors.full_messages}
      end
    elsif @current_user.family?
      hl = Family::HealthLifestyle.new(user_params)
      hl.family_id = @current_user.id
      if hl.valid?
        render json: { result: "Successful" }
      else
        render json: {errors: hl.errors.full_messages}
      end
    else
      render json: { errors: ["User not found"] }
    end
  end

  def show
    if @current_user.student?
      render json: { health_lifestyle: @current_user.health_lifestyle }
    else
      render json: { error: ["only students have health_lifestyle"] }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { health_lifestyle: u.health_lifestyle}
    else
      render json: { errors: ["Unauthorized"]}
    end
  end

  private
    def user_params
      params.require(:user).permit(:allergies, :handicaps, :pets, :diet, :smoking)
    end
end
