class EventsController < ApplicationController
  rescue_from Application::EventNotFoundError, with: :event_not_found
  rescue_from Application::EventExpiredError, with: :event_expired
  before_filter :load_event, only: [:apply]

  def index
    @events = Event.all
  end

  def apply
    redirect_to "/auth/linkedin" and return if session[:applying_to]
    session[:applying_to] = @event.id
    render "public_show", layout: "public"
  end

  private
  def event_not_found
    render text: "Evento no encontrado!", status: 404
  end
  def event_expired
    render text: "Evento expirado!", status: 404
  end

  def load_event
    @event = Event.where(id: params[:id]).first
    raise Application::EventNotFoundError unless @event
    raise Application::EventExpiredError unless @event.when > Time.now.beginning_of_day
  end
end