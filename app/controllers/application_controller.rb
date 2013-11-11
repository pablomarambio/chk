class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :log_request

  def log_request
  	Rails.logger.info "Session keys: [#{session.keys.join(", ")}]"
  	Rails.logger.info "Request keys: [#{params.keys.join(", ")}]"
  end
end
