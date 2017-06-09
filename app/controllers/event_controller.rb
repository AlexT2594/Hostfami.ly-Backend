class EventController < ApplicationController
	  before_action :authenticate_request!
  def create
    event = Event.new(event_params)
    event.volunteer = @current_user
    if event.save
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
      render json: { result: Event.find(params[:id]) }
    end
  end

  def index
    events = Event.all
    render json: { events: events}
  end

  def post_params
    params.permit(:title, :place, :description, :date)
  end
end
