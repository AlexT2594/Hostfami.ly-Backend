class MyDescriptionController < ApplicationController
  before_filter :authenticate_request!

  def create
    if @current_user.student?
      @student = @current_user
      @student.my_description = Student::MyDescription.new(student_params)

      if @student.my_description.save
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
      params.require(:user).permit(:description)
    end
end
