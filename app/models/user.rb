class User < ApplicationRecord
  before_save { email.downcase! }

  validates :firstname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :lastname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :birthday, presence: true
  validates :state, presence: true, length: {minimum: 2,maximum: 50}
  validates :city, presence: true, length:{minimum: 2,maximum: 50}
  validates :address, presence: true, length:{minimum: 2,maximum: 50}

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

  has_many :posts

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def volunteer?
    self.type == "Volunteer"
  end

  def family?
    self.type == "Family"
  end

  def student?
    self.type == "Student"
  end

end
