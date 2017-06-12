class DataController < ApplicationController
  before_action :authenticate_request!

  def show
    if @current_user.student?
      render json: {
        data: {
          about_me: @current_user.about_me,
          educational_background: @current_user.educational_background,
          health_lifestyle: @current_user.health_lifestyle,
          my_description: @current_user.my_description,
          passport_info: @current_user.passport_info,
          uncompleted_sections: @current_user.uncompleted_sections
        }
      } , :except => [:created_at,:updated_at,:password_digest,:email_confirmed,:confirm_token]
    elsif @current_user.family?
      render json: {
        data: {
          # Please render family forms here as student
        }
      }
    else
      render json: {
        data: {
          # Please render volunteer forms here as student
        }
      }
    end
  end

end
