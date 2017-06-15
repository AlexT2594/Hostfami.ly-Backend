class Student::EducationalBackground < ApplicationRecord
  self.table_name = "student_educational_backgrounds"
  belongs_to :student

  VALID_DATE_REGEX = /\A(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})\z/

  validates :school, length: {minimum:2,maximum: 50}
  validates :from, format: {with: VALID_DATE_REGEX}
  validates :to, format: {with: VALID_DATE_REGEX}
  validates :description, length: {minimum:2,maximum:50}
  validates :mother_language, length: {minimum:2,maximum:50}

  def invalid_to
  	if self.to < self.from
  		errors[:base] << "To can't be smaller than from"
  	end
  end
end
