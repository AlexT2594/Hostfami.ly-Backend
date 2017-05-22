class User < ApplicationRecord
  before_save { email.downcase! }

  validates :firstname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :lastname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :birthday, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :address, presence: true
  validates :utype, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false },
                    confirmation: true

  validates :email_confirmation, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 },
  					   format: {with: VALID_PASSWORD_REGEX}



  has_secure_token :confirm_token

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

end
