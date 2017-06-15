class Student::AboutMe < ApplicationRecord
  self.table_name = "student_about_mes"
  belongs_to :student

  VALID_CELL_REGEX = /\A(\+\d{1,3}[- ]?)?\d{10}\z/
  VALID_TEL_REGEX = /\A\d{4,}\z/
  VALID_WEIGHT_REGEX = /\A\d+(\.\d{1,2})?\z/
  VALID_HEIGHT_REGEX = /\A\d{2,3}\z/

  validates :tell, length: { maximum:15},
  				   format: {with: VALID_TEL_REGEX}
  validates :cell, length: {maximum: 15},
  				   format: {with: VALID_CELL_REGEX}
  validates :religion, length: {maximum: 50}
  validates :religion_celebrations, :inclusion => 1..3
  validates :height, format: {with: VALID_HEIGHT_REGEX}
  validates :weight, format: {with: VALID_WEIGHT_REGEX}
end
