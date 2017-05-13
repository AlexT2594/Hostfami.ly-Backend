class Volunteer < User
  has_one :about_me, dependent: :destroy
end
