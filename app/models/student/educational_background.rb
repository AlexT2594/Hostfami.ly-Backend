class Student::EducationalBackground < ApplicationRecord
  self.table_name = "student_educational_backgrounds"
  belongs_to :student

  validates :school, length: {minimum:2,maximum: 50}
end
