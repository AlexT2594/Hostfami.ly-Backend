class Student::AboutMe < ApplicationRecord
  self.table_name = "student_about_mes"
  belongs_to :student

  VALID_CELL_REGEX = /\A(\+\d{1,3}[- ]?)?\d{10}\z/
  VALID_TEL_REGEX = /\A\d{4,}\z/
  VALID_WEIGHT_REGEX = /\A\d+(\.\d{1,2})?\z/
  VALID_HEIGHT_REGEX = /\A\d{2,3}\z/

  validates :tell, length: { maximum:15},
  				   format: {with: VALID_TEL_REGEX}, :allow_blank => true
  validates :cell, length: {maximum: 15},
  				   format: {with: VALID_CELL_REGEX}, :allow_blank => true
  validates :religion, length: {maximum: 50}, :allow_blank => true
  validates :religion_celebrations, :inclusion => 1..3, :allow_blank => true
  validates :height, format: {with: VALID_HEIGHT_REGEX}, :allow_blank => true
  validates :weight, format: {with: VALID_WEIGHT_REGEX}, :allow_blank => true
end
