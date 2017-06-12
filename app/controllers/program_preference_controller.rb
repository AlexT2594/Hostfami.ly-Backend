class ProgramPreferenceController < ApplicationController
  before_action :authenticate_request!

  def create
    pp = Student::ProgramPreference.new(country: params[:country])
    @current_user.program_preference = pp
    if !@current_user.program_preference
      render json: {error: "Something went wrong"}
    else
      render json: {result: "Success"}
    end
  end

  def show
    render json: { program_preference: @current_user.presence || "" }
  end
end
