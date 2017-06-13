class Request < ApplicationRecord
	validate :student_and_family
	belongs_to :student, optional: true
	belongs_to :family, optional: true

	validates :status, :inclusion => { :in => %w(pending accepted associated rejected), message: "%{value} is not valid"}

	self.per_page = 10
  	default_scope ->{ order('created_at DESC') }

	def student_and_family
		if student_id.blank? and family_id.blank?
			errors[:base] << "At least student or family must be filled"
		end
	end
end
