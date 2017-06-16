class MyDescriptionController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      md = Student::MyDescription.new(student_params)
      md.student_id = @current_user.id
      if md.valid?
        @current_user.my_description = md
        render json: { result: "Successful" }
      else
        render json: { error: md.errors.full_messages }
      end
    else
      render json: { errors: ["Unknown user"] }
    end
  end

  def show
    if @current_user.student?
      render json: { my_description: @current_user.my_description }
    else
      render json: { errors: ["only students have my description"] }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { my_description: u.my_description}
    else
      render json: { errors: ["Unauthorized"]}
    end
  end

  private
    def student_params
      params.require(:user).permit(:description)
    end
end
