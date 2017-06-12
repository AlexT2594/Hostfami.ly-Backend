class RequestController < ApplicationController
  def create

    if @current_user.volunteer?
    	render json: {error: "Only a student can create a request"}
    end

    request = Request.new
    if @current_user.student?
      request = Request.new({
        student_fullname: @current_user.firstname + " " + @current_user.lastname,
        student_city: @current_user.city,
        student_state: @current_user.state
      })
      request.student = @current_user
    elsif @current_user.family?
      request = Request.new({
        family_lastname: @current_user.lastname,
        family_city: @current_user.city
      })
    end

    if request.save
      render json: { result: "Successful" }
    else
      render json: { error: request.errors.full_messages }
    end
  end

  def index
    r = nil
    if params[:type] == "student"
      r = Request.where(family: nil)
    elsif params[:type] == "family"
      r = Request.where(student: nil)
    end

    if !r
      render json: { error: "Requests not found" }
    else
      requests = r.where(status: params[:status]).page(params[:page]).order('created_at DESC')
      render json: { requests: requests, total_pages: requests.total_pages }
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


  def filter_request

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
