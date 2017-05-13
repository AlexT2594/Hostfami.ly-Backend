class Student::AboutMe < ApplicationRecord
  self.table_name = "student_about_mes"
  belongs_to :student
end
