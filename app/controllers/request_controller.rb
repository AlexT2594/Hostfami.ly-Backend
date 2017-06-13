class RequestController < ApplicationController
  before_action :authenticate_request!

  def create

    if @current_user.volunteer?
    	render json: {error: "Only a student can create a request"}
    end

    request = Request.new
    if @current_user.student?
      uncomp = @current_user.uncompleted_sections
      if uncomp.length != 0
        render json: { error: "You have uncompleted forms", details: uncomp}
      else
        request = Request.new({
          student_fullname: @current_user.firstname + " " + @current_user.lastname,
          student_city: @current_user.city,
          student_state: @current_user.state
        })
        @current_user.request = request
      end
    elsif @current_user.family?
      request = Request.new({
        family_lastname: @current_user.lastname,
        family_city: @current_user.city
      })
      @current_user.request = request
    end

    if request.save
      render json: { result: "Successful" }
    else
      render json: { error: request.errors.full_messages }
    end
  end

  def show
    if !@current_user.volunteer?
      req = @current_user.request
      if req
        render json: { result: req }
      else
        render json: { error: "No request found"}
      end
    else
      render json: { error: "Vols don't have requests"}
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
      requests = r.where(status: params[:status]).page(params[:page])
      render json: { requests: requests, total_pages: requests.total_pages }
    end
  end

  def update
  	if !Request.exists?(params[:id])
  		render json: {error:"We couldn't find a matching request"}
    else
      request = Request.find(params[:id])
      if request.update_attributes(req_params)
      	render json: {result:"Request updated successfully"}
      else
      	render json: {error:"Could not update your request"}
      end
    end
  end

  def req_params
    params.require(:request).permit(:family_id, :student_id, :status)
  end

  def destroy
  	if !Request.exists?(params[:id])
  		render json: {error:"Request not found"}
  	else
  		request = Request.find(params[:id])
  		request.destroy
  		render json: {result:"Request deleted"}
  	end
  end

  def incoming_students
    res = Request.where(status: "accepted", student_state: @current_user.state).page(params[:page])
    render json: { requests: res, total_pages: res.total_pages }
  end

end
