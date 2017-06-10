class RequestController < ApplicationController
  before_action :authenticate_request!
  def create
    request = Request.new()
    @current_user.request = request
    request.student = @current_user
    if !@current_user.student?
    	render json: {error: "Only a student can create a request"}
    elsif request.save
      render json: { result: "Successful" }
    else
      render json: { error: "Oh nap! We had problems creating your request!!" }
    end
  end

  def index
  	if @current_user.volunteer? 
  		volunteer_city = @current_user.city
  		requests = []
  		Request.all.each do |request|
  			if request.student.city == volunteer_city
          requests << request.to_json
        end
  		end

	    if(requests.size == 0)
	      render json: { error: "Requests not found" }
	    else
	      render json: { result: requests}, :except => [:created_at,:updated_at]
	    end
  	
  	elsif @current_user.family?
  		request = Request.find_by_family_id(@current_user.id)
  		if !request
  			render json: {error: "Request not found"}
  		else
  			render json: {result: request}
  		end

  	else
  		request = Request.find_by_student_id(@current_user.id)
  		if !request
  			render json: {error: "Request not found"}
  		else
  			render json: {result: request}
  		end	
  	end
  end

  def update
    request = Request.exists?(params[:id])
    if !request
      render json: {error:"Request not found"}
    else
      request = Request.find(params[:id])
      request.family_id = params[:family_id]
      request.state = params[:state]
      render json: {error:"Request updated successfully"}
    end
  end

  private
    def post_params
      params.require(:post).permit(:id,:family_id, :state)
    end
end

