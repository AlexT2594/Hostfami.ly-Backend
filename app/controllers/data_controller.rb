class DataController < ApplicationController
  before_action :authenticate_request!

  def show
    if @current_user.student?
      render json: {
        user: ActiveModelSerializers::SerializableResource.new(@current_user, adapter: :json, root: false).as_json[@current_user.type.downcase.to_sym],
        data: {
          about_me: @current_user.about_me,
          educational_background: @current_user.educational_background,
          health_lifestyle: @current_user.health_lifestyle,
          my_description: @current_user.my_description,
          passport_info: @current_user.passport_info
        }
      } , :except => [:created_at,:updated_at,:password_digest,:email_confirmed,:confirm_token]
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
