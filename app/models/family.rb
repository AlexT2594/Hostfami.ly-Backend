class Family < User
  has_one :about, dependent: :destroy
end
