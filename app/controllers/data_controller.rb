class DataController < ApplicationController
  before_action :authenticate_request!

  def show
    if @current_user.student?
      render json: {
        data: {
          uncompleted_sections: @current_user.uncompleted_sections
        }
      } , :except => [:created_at,:updated_at,:password_digest,:email_confirmed,:confirm_token]
    elsif @current_user.family?
      render json: {
        data: {
          uncompleted_sections: @current_user.uncompleted_sections
        }
      }
    else
      render json: {
        data: {
          uncompleted_sections: []
        }
      }
    end
  end

end
