class Family < User
  has_one :request, dependent: :destroy
  has_one :health_lifestyle, dependent: :destroy

  after_create do |fam|
    fam.request = Request.new({
      family_lastname: fam.lastname,
      family_city: fam.city
    })
  end
end
