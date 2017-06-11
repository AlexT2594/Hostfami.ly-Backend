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
  		if params.has_key?(:type) && params[:type] == "student"

	  		Request.find_each do |request|
	  			  next if !Student.exists?(request.student_id) || Student.find(request.student_id).city != volunteer_city  || request.family_id != ""
	  				request_to_send = {}
	  				request_to_send["student"] = Student.find(request.student_id)
	  				request_to_send["family"] = ""
	  				request_to_send["state"] = request.state
	          requests << request_to_send
	  		end

        if(requests.size == 0) 
          render json: {error: "Requests not found"}
        else
          render json: { result: requests}, :except => [:created_at,:updated_at]
        end


  		elsif params.has_key?(:type) && params[:type] == "family"
  			Request.find_each do |request|
  				next if !Family.exists?(request.family_id) || Family.find(request.family_id).city != volunteer_city || request.student_id != ""
	  			request_to_send = {}
  				request_to_send["student"] = ""
  				request_to_send["family"] = Family.find(request.family_id)
  				request_to_send["state"] = request.state
          requests << request_to_send 				
  			end

  			render json: { result: requests}, :except => [:created_at,:updated_at]

  		else
  			render json: {error:"Type not specified"}
  		end
  	
  	elsif @current_user.family?
  		request = Request.find_by_family_id(@current_user.id)
  		if !request
  			render json: {error: "Request not found"}
  		else
			  request_to_send = {}
				request_to_send["student"] = request.student
				request_to_send["family"] = Family.find(request.family_id)
				request_to_send["state"] = request.state
  			render json: {result: request_to_send}, :except => [:created_at,:updated_at]
  		end

  	else
  		request = Request.find_by_student_id(@current_user.id)
  		if !request
  			render json: {error: "Request not found"}
  		else
 			  request_to_send = {}
				request_to_send["student"] = request.student
				request_to_send["family"] = Family.find(request.family_id)
				request_to_send["state"] = request.state
  			render json: {result: request_to_send}, :except => [:created_at,:updated_at]
  		end	
  	end
  end

  def update
    request = Request.exists?(params[:id])
  	if !Request.exists?(params[:id]) || !Family.exists?(params[:family_id])
  		render json: {error:"We couldn't find a matching request"}
    else
      request = Request.find(params[:id])
      request.family_id = params[:family_id]
      request.state = params[:state]
      if request.save
      	render json: {result:"Request updated successfully"}
      else
      	render json: {error:"Could not update your request"}
      end
    end
  end

  def delete
  	if !Request.exists?(params[:id])
  		render json: {error:"Request not found"}
  	else
  		request = Request.find(params[:id])
  		request.destroy
  		render json: {result:"Request deleted"}
  	end

  end

end

