class PassportInfoController < ApplicationController
  before_filter :authenticate_request!

  def create
    if @current_user.student?
      @student = @current_user
      @student.passport_info = Student::PassportInfo.new(student_params)

      if @student.passport_info.save
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
      params.permit(:firstname, :lastname, :number, :release, :expiration, :birth_country)
    end
end
