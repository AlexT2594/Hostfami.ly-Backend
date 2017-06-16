class ProgramPreferenceController < ApplicationController
  before_action :authenticate_request!

  def create
    if theres_hosting_family
      @current_user.program_preference = Student::ProgramPreference.new(country: params[:country])
      render json: {result: "Success"}
    else
      render json: {errors: ["Looks like there's no remaining hostfamily for that country"]}
    end
  end

  def theres_hosting_family
    Request.where(student_state: params[:country]).count - Family.includes(:request).where( :requests => { :student_id => nil }).where(params[:country]).count > 0
  end

  def show
    render json: { program_preference: @current_user.program_preference || "" }
  end
end
