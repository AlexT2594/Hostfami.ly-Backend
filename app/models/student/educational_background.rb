class Student::EducationalBackground < ApplicationRecord
  self.table_name = "student_educational_backgrounds"
  belongs_to :student

  validates :school, length: {minimum:2,maximum: 50}, :allow_blank => true
  validates :description, length: {minimum:2,maximum:50}, :allow_blank => true
  validates :mother_language, length: {minimum:2,maximum:50}, :allow_blank => true

  def invalid_to
  	if self.to and self.from and self.to.to_date < self.from.to_date
  		errors[:base] << "To can't be smaller than from"
  	end
  end
end
