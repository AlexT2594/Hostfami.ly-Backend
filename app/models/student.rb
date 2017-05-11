class Student < User
  has_one :about_me, dependent: :destroy
  has_one :educational_background, dependent: :destroy
  has_one :health_lifestyle, dependent: :destroy
  has_one :my_description, dependent: :destroy
  has_one :passport_info, dependent: :destroy
  has_one :program_preference, dependent: :destroy
end
