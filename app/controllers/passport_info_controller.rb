class PassportInfoController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      @student = @current_user
      @student.passport_info = Student::PassportInfo.new(student_params)

      if @student.passport_info.save
        render json: { result: "Successful" }
      else
        render json: { errors: @student.passport_info.errors.full_messages }
      end
    else
      render json: { error: "Unknown user" }
    end
  end

  def show
    if @current_user.student?
      render json: { about_me: @current_user.passport_info }
    else
      render json: { error: "only students have passport info" }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { passport_info: u.passport_info}
    else
      render json: { error: "Unauthorized"}
    end
  end

  private
    def student_params
      params.require(:user).permit(:firstname, :lastname, :number, :release, :expiration, :birth_country)
    end
end
