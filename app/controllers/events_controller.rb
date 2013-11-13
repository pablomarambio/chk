class EventsController < ApplicationController
  rescue_from Application::EventNotFoundError, with: :event_not_found
  rescue_from Application::EventExpiredError, with: :event_expired
  before_filter :load_event, only: [:public_apply, :public_show]
  load_and_authorize_resource only: [:index, :show, :edit, :update, :new]

  def public_show
    session[:applying_to] = nil
    render layout: "public"
  end

  def public_apply
    session[:applying_to] = @event.id
    render layout: "public"
  end

  def update
    if @event.update(event_params)
      redirect_to(@event)
    else
      render "edit"
    end
  end

  def create
    @event = Event.new(event_params)
    authorize! :create, @event
    if @event.save
      redirect_to event_path(@event)
    else
      render "new"
    end
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

  def event_params
    params.require(:event).permit(:when, :duration, :address, :city, :country, :name, :description, :picture, :price)
  end

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