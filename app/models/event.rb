class Event < ActiveRecord::Base
  class << self
    def upcoming_for city
      Event.where(city: city).where("\"when\" >= ?", Time.now.beginning_of_day)
    end
  end
end
