class Event < ActiveRecord::Base
	validates :event_body, presence: true, length: { minimum: 1, maximum: 140 }
end
