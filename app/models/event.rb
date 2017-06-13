class Event < ApplicationRecord
	belongs_to :volunteer
	self.per_page = 10
  	default_scope ->{ order('created_at') }

	validates :title, presence: true
	validates :place, presence: true
	validates :description, presence: true
	validates :date, presence: true
end
