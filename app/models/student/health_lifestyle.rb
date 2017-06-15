class Student::HealthLifestyle < ApplicationRecord
  self.table_name = "student_health_lifestyles"
  belongs_to :student
  
end
