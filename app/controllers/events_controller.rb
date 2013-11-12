class EventsController < ApplicationController
  rescue_from Application::EventNotFoundError, with: :event_not_found
  rescue_from Application::EventExpiredError, with: :event_expired
  before_filter :load_event, only: [:public_apply, :public_show]

  def index
    @events = Event.all
  end

  def public_show
    session[:applying_to] = nil
    render layout: "public"
  end

  def public_apply
    session[:applying_to] = @event.id
    render layout: "public"
  end

  def apply
    redirect_to "/auth/linkedin" and return unless user_signed_in?
    redirect_to public_show_event_path(session[:applying_to])
    Event.find(session[:applying_to]).apply(current_user)
    session[:applying_to] = nil
    flash[:notice] = "You have applied successfully. You will receive an email shortly from our team"
  rescue Application::AlreadyAppliedError
    flash[:error] = "You already applied to this event."
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