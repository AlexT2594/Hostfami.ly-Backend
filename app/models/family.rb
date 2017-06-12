class Family < User
  has_one :request, dependent: :destroy
end
