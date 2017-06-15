class Student::PassportInfo < ApplicationRecord
  self.table_name = "student_passport_infos"
  belongs_to :student

  VALID_DATE_REGEX = /\A(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})\z/

  validates :firstname, length: {maximum: 50}
  validates :lastname, length: {maximum: 50}
  validates :number, length: {maximum: 50}
  validates :release, format: {with: VALID_DATE_REGEX}
  validates :expiration, format: {with: VALID_DATE_REGEX}
  validate :invalid_expiration
  validates :birth_country, length: {maximum:50}

  def invalid_expiration
  	if self.release and self.expiration and self.release > self.expiration
  		errors[:base] << "Release can't be greater than expiration"
  	end
  end
end
