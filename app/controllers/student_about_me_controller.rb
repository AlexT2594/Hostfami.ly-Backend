class StudentAboutMeController < ApplicationController
  before_filter :authenticate_request!

  def create

  end

  private
    def user_params
      params.require(:user).permit(:gender, :weight, :height, :tell,:cell, :religion, :tutor_email, :religion_celebrations)
    end
end
