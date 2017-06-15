class Family::HealthLifestyle < ApplicationRecord
  self.table_name = "family_health_lifestyles"
  belongs_to :family
end