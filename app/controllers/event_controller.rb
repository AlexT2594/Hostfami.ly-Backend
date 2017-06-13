class EventController < ApplicationController
	  before_action :authenticate_request!
  def create
    pars = event_params
    pars[:organiser] = @current_user.firstname + " " + @current_user.lastname
    event = Event.new(pars)
    @current_user.events << event
    event.volunteer = @current_user
    if !@current_user.volunteer?
    	render json: {error: "Only volunteers can create events"}
    elsif event.save
      render json: { result: "Successful" }
    else
      render json: { error: "Oh snap! We had a problem creating your event!!" }
    end
  end

  def show
    event = Event.exists?(params[:id])
    if !event
      render json: { error: "Event not found" }
    else
      event = Event.find(params[:id])
      event_to_send = event.attributes
      event_to_send["volunteer"] = event.volunteer #do we need to show all information of an event
      render json: { result: event_to_send } #canceled created_at so we can show when the event was created
    end
  end

  def index
    events = Event.all.page(params[:page])
    render json: { events: events, total_pages: events.total_pages} , :except => [:created_at,:updated_at]
  end

  def destroy
    if !Event.exists?(params[:id])
      render json: {error:"Event not found"}
    else
      event = Event.find(params[:id])
      event.destroy
      render json: {result:"Event deleted"}
    end
  end

  private
    def event_params
      params.require(:event).permit(:title, :place, :description, :date)
    end
end
