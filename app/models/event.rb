class Event < ApplicationRecord
	belongs_to :volunteer

	validates :title, presence: true
	validates :place, presence: true
	validates :description, presence: true
	validates :date, presence: true
end
