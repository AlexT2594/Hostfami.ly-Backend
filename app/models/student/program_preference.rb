class Student::ProgramPreference < ApplicationRecord
  self.table_name = "student_program_preferences"
  belongs_to :student
  validates :country, length: {maximum: 50}
end
