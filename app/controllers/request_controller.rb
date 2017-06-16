class RequestController < ApplicationController
  before_action :authenticate_request!

  def create

    if @current_user.volunteer?
    	render json: {error: "Only a student can create a request"}
    else
      request = Request.new
      if @current_user.student?
        uncomp = @current_user.uncompleted_sections
        if uncomp.length != 0
          render json: { errors: ["You have uncompleted forms"], details: uncomp}
        else
          request = Request.new({
            student_fullname: @current_user.firstname + " " + @current_user.lastname,
            student_city: @current_user.city,
            student_state: @current_user.program_preference.country
          })
          @current_user.request = request
          render json: { result: "Successful" }
        end
      elsif @current_user.family?
        request = Request.new({
          family_lastname: @current_user.lastname,
          family_city: @current_user.city
        })
        @current_user.request = request
        render json: { result: "Successful" }
      else
        render json: { errors: request.errors.full_messages }
      end
    end
  end

  def show
    if !@current_user.volunteer?
      req = @current_user.request
      if req
        render json: { result: req }
      else
        render json: { errors: ["No request found"]}
      end
    else
      render json: { errors: "Vols don't have requests"}
    end
  end

  def index
    r = nil
    if params[:type] == "student"
      r = Request.where(family: nil, student_city: @current_user.city)
    elsif params[:type] == "family"
      r = Request.where(student: nil, family_city: @current_user.city)
    end

    if !r
      render json: { error: "Requests not found" }
    else
      requests = r.where(status: params[:status]).page(params[:page])
      render json: { requests: requests, total_pages: requests.total_pages }
    end
  end

  def handle_request
    req = Request.new(
      status: "associated",
      family_lastname: params[:family_lastname],
      student_fullname: params[:student_fullname],
      student_state: params[:student_state],
      student_city: params[:student_city],
      family_city: params[:family_city]
    )
    stud = Student.find_by(id: params[:student_id])
    fam = Family.find_by(id: params[:family_id])
    if stud && fam
      stud.request = req
      fam.request = req
      render json: { result: "Success" }
    else
      render json: { result: "Couldn't find either family or student" }
    end
  end


  def update
    request = Request.find_by(id: params[:id])
  	if !request
  		render json: {error:"We couldn't find a matching request"}
    else
      if request.update_attributes(req_params)
        receiver = nil
        if request.student
          receiver = request.student
        else
          receiver = request.family
        end
        if @current_user.volunteer? and params[:request][:status] == "accepted"
          RequestNotificationMailer.send_accepted_notification(receiver).deliver_later if receiver.email_notification
          #SmsNotification.send_sms('+393202237655','accepted') if request.student.sms_notification
        elsif @current_user.volunteer? and params[:request][:status] == "rejected"
          RequestNotificationMailer.send_rejected_notification(receiver).deliver_later if receiver.email_notification
          #SmsNotification.send_sms('+393202237655','rejected') if request.student.sms_notification
        end
      	render json: {result:"Request updated successfully"}
      else
      	render json: {error:"Could not update your request"}
      end
    end
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

  private
  def req_params
    params.require(:request).permit(:family_id, :student_id, :status)
  end
end
