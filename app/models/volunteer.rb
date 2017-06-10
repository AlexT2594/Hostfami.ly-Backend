class Volunteer < User
  has_one :about_me, dependent: :destroy
  has_many :events
end
