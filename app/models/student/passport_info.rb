class Student::PassportInfo < ApplicationRecord
  self.table_name = "student_passport_infos"
  belongs_to :student
end
