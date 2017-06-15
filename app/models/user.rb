class User < ApplicationRecord
  before_save { email.downcase! }

  VALID_DATE_REGEX = /\A(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}/

  validates :firstname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :lastname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :birthday, presence: true, format: {with: VALID_DATE_REGEX}
  validate :old_enough
  validates :state, presence: true, length: {minimum: 2,maximum: 50}
  validates :city, presence: true, length:{minimum: 2,maximum: 50}
  validates :address, presence: true, length:{minimum: 2,maximum: 50}

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

  def old_enough
  	if self.birthday and (self.birthday.to_date + 18.years) > Date.today and (volunteer? or family?)
  		errors[:base] << "Volunteers or family representative must be at least 18"
  	end
  	if self.birthday and student? and (self.birthday.to_date + 25.years < Date.today)
  		errors[:base] << "Student can't be older than 25"
  	end
  end

end
