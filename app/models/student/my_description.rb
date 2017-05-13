class Student::MyDescription < ApplicationRecord
  self.table_name = "student_my_description"
  belongs_to :student
end
