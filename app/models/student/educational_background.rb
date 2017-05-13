class Student::EducationalBackground < ApplicationRecord
  self.table_name = "educational_backgrounds"
  belongs_to :student
end
