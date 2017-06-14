class MyDescriptionController < ApplicationController
  before_action :authenticate_request!

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

  def show
    if @current_user.student?
      render json: { my_description: @current_user.my_description }
    else
      render json: { error: "only students have my description" }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { my_description: u.my_description}
    else
      render json: { error: "Unauthorized"}
    end
  end

  private
    def student_params
      params.require(:user).permit(:description)
    end
end
