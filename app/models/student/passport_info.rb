class Student::PassportInfo < ApplicationRecord
  self.table_name = "student_passport_infos"
  belongs_to :student

  validates :firstname, length: {maximum: 50}
  validates :lastname, length: {maximum: 50}
  validates :number, length: {maximum: 50}
  validate :invalid_expiration
  validates :birth_country, length: {maximum:50}

  def invalid_expiration
  	if self.release and self.expiration and self.release.to_date > self.expiration.to_date
  		errors[:base] << "Release can't be greater than expiration"
  	end
  end
end
