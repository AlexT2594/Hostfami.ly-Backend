class Volunteer < User
  has_one :about_me, dependent: :destroy
  has_many :events

  def send_accepted
    UserAuthMailer.send_welcome(self)
    self.email_activate
  end
end
