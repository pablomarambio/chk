# I whould have named this 'application', but Rails wouldn't let me
class Petition < ActiveRecord::Base
	belongs_to :user
	belongs_to :event
end
