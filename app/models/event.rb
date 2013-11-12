class Event < ActiveRecord::Base
  has_many :petitions
  has_many :users, through: :petitions

  class << self
    def upcoming_for city
      Event.where(city: city).where("\"when\" >= ?", Time.now.beginning_of_day)
    end
  end

  def apply user
    raise Application::AlreadyAppliedError if self.petitions.where(user_id: user.id).any?
    self.petitions.create(
      user_id: user.id,
      status: "requested"
    )
  end
end
