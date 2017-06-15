class HealthLifestyleController < ApplicationController
  before_action :authenticate_request!

  def create
    @user = nil
    if @current_user.student?
      @user = @current_user
      @user.health_lifestyle = Student::HealthLifestyle.new(user_params)
    elsif @current_user.family?
      @user = @current_user
      @user.health_lifestyle = Family::HealthLifestyle.new(user_params)
    end

    if !@user
      render json: {error:"Unknown user"}
    elsif @user.health_lifestyle.save
      render json: { result: "Successful" }
    else
      render json: { error: "User not found" }
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
