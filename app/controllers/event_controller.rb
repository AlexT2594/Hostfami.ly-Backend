class EventController < ApplicationController
	  before_action :authenticate_request!
  def create
    event = Event.new(event_params)
    @current_user.events << event
    event.volunteer = @current_user
    if !current_user.volunteer?
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
      event_to_send["volunteer"] = event.volunteer
      event_to_send.delete("volunteer_id")
      render json: { result: event_to_send } , :except => [:created_at,:updated_at]
    end
  end

  def index
    events = Event.all
    render json: { events: events} , :except => [:created_at,:updated_at]
  end

  private
    def event_params
      params.require(:event).permit(:title, :place, :description, :date)
    end
end
