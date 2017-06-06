class EducationalBackgroundController < ApplicationController
  before_filter :authenticate_request!

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

  private
    def student_params
      params.require(:user).permit(:school, :from, :to, :description, :graduated, :mother_language)
    end
end
