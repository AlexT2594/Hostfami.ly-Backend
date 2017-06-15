class Family < User
  has_one :request, dependent: :destroy
  has_one :health_lifestyle, dependent: :destroy
end
