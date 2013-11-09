class EventsController < ApplicationController
  rescue_from Application::EventNotFoundError, with: :event_not_found
  rescue_from Application::EventExpiredError, with: :event_expired
  before_filter :load_event

  def apply
    redirect_to "/auth/linkedin" and return if session[:applying_to]
    id = params[:event_id]
    session[:applying_to] = id
    render "show", layout: false
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