class PassportInfoController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      pi = Student::PassportInfo.new(student_params)
      pi.student_id = @current_user.id
      if pi.valid?
        @current_user.passport_info = pi
        render json: { result: "Successful" }
      else
        render json: { errors: pi.errors.full_messages }
      end
    else
      render json: { errors: ["Unknown user"] }
    end
  end

  def show
    if @current_user.student?
      render json: { passport_info: @current_user.passport_info }
    else
      render json: { errors: ["only students have passport info"] }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { passport_info: u.passport_info}
    else
      render json: { errors: ["Unauthorized"]}
    end
  end

  private
    def student_params
      params.require(:user).permit(:firstname, :lastname, :number, :release, :expiration, :birth_country)
    end
end
