class EducationalBackgroundController < ApplicationController
  before_action :authenticate_request!

  def create
    if @current_user.student?
      eb = Student::EducationalBackground.new(student_params)
      eb.student_id = @current_user.id
      if eb.valid?
        @current_user.educational_background = eb
        render json: { result: "Successful" }
      else
        render json: { errors: @student.educational_background.errors.full_messages }
      end
    else
      render json: { errors: ["Unknown user"] }
    end
  end

  def show
    if @current_user.student?
      render json: { educational_background: @current_user.educational_background }
    else
      render json: { errors: ["only students have ed background"] }
    end
  end

  def of_student
    u = Student.find_by(params[:student_id])
    if @current_user.volunteer? && u
      render json: { educational_background: u.educational_background}
    else
      render json: { errors: ["Unauthorized"]}
    end
  end

  private
    def student_params
      params.require(:user).permit(:school, :from, :to, :description, :graduated, :mother_language)
    end
end
