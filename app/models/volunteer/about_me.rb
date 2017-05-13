class Volunteer::AboutMe < ApplicationRecord
  self.table_name = "volunteer_about_mes"
  belongs_to :volunteer
end
