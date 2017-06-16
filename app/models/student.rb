class Student < User
  has_one :about_me, dependent: :destroy
  has_one :educational_background, dependent: :destroy
  has_one :health_lifestyle, dependent: :destroy
  has_one :my_description, dependent: :destroy
  has_one :passport_info, dependent: :destroy
  has_one :program_preference, dependent: :destroy
  has_one :request, dependent: :destroy

  include EmptyDetect

  after_create do |stud|
    stud.request = Request.new({
      student_fullname: stud.firstname + " " + stud.lastname,
      student_city: stud.city
    })
  end

  def uncompleted_sections
    res = []
    if missing_attrs(about_me)
      res << "about_me"
    end
    if missing_attrs(educational_background)
      res << "educational_background"
    end
    if missing_attrs(health_lifestyle)
      res << "health_lifestyle"
    end
    if missing_attrs(my_description)
      res << "my_description"
    end
    if missing_attrs(passport_info)
      res << "passport_info"
    end
    if missing_attrs(program_preference)
      res << "program_preference"
    end

    res
  end
end
