class User < ApplicationRecord
  before_save { email.downcase! }

  validates :firstname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :lastname, presence: true, length: { minimum: 2, maximum: 50 }
  validates :gender, presence: true

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



end
