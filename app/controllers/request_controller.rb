class RequestController < ApplicationController
  before_action :authenticate_request!
  def create
    request = Request.new(request_params)
    request.student = @current_user
    if !@current_user.student?
    	render json: {error: "Only a student can create a request"}
    elsif request.save
      render json: { result: "Successful" }
    else
      render json: { error: "Oh nap! We had problems creating your request!!" }
    end
  end

  def requests
  	if @current_user.volunteer? 
  		volunteer_city = params[:city]
  		requests = Request.all

	    requests.each do |request|
	    	if(request.student.city != volunteer_city) requests.delete(request)
	    end

	    if !requests
	      render json: { error: "Requests not found" }
	    else
	      render json: { result: requests }
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
end

