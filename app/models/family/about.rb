class Family::About < ApplicationRecord
  self.table_name = "family_abouts"
  belongs_to :family
end
