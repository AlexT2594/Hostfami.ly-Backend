class EducationalBackgroundController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      @student = @current_user
      @student.educational_background = Student::EducationalBackground.new(student_params)

      if @student.educational_background.save
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
      render json: { educational_background: @current_user.educational_background }
    else
      render json: { error: "Only students have ed back" }
    end
  end

  private
    def student_params
      params.require(:user).permit(:school, :from, :to, :description, :graduated, :mother_language)
    end
end
