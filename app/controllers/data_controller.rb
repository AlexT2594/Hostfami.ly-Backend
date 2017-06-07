class DataController < ApplicationController
  before_filter :authenticate_request!

  def show
    if @current_user.student?
      render json: {
        user: @current_user,
        data: {
          educational_background: @current_user.educational_background,
          health_lifestyle: @current_user.health_lifestyle,
          my_description: @current_user.my_description,
          passport_info: @current_user.passport_info
        }
      }
    elsif @current_user.family?
      render json: {
        user: @current_user
      }
    else
      render json: {
        user: @current_user
      }
    end
  end

end
