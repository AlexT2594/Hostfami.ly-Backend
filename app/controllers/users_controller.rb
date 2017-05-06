class UsersController < ApplicationController
	respond_to :json
	#before_create :build_resource

	def show
		user = User.find(params[:id])
		render json: user, :include => :user_profile, status: 200
	end

  def create
    resource = build_resource(params)

    if resource.save
      render json: resource, :include => :user_profile, status: 201
    else
      render json: { errors: resource.errors }, status: 422
    end
  end

	def update
	  user = User.find(params[:id])

	  if user.update(user_params)
	    render json: user, :include => :user_profile, status: 200, location: [user]
	  else
	    render json: { errors: user.errors }, status: 422
	  end
	end

	def destroy
	  user = User.find(params[:id])
	  user.destroy
	  head 204
	end

  private

		def user_params
			params.require(:user).permit(:email, :password, :password_confirmation, :user_profile)
    end

		def user_profile_params
			params.require(:user).require(:user_profile).permit(:utype, :name, :last_name, :country, :city, :gender)
    end

		def build_resource(hash=nil)
			resource = User.new(user_params)
			resource.user_profile = UserProfile.new(user_profile_params)

			resource
		end

end
