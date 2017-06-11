class Request < ApplicationRecord
	validate :student_and_family

	def student_and_family
		if student_id.blank? and family_id.blank?
			errors.add_to_base("At least student or family must be filled")
		end
	end
end
