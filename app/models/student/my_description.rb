class Student::MyDescription < ApplicationRecord
  self.table_name = "student_my_descriptions"
  belongs_to :student
end
