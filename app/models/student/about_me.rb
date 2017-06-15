class Student::AboutMe < ApplicationRecord
  self.table_name = "student_about_mes"
  belongs_to :student

  VALID_CELL_REGEX = /^(\+\d{1,3}[- ]?)?\d{10}$/
  VALID_TEL_REGEX = /^\d{4,}$/
  VALID_WEIGHT_REGEX = /^\d+(\.\d{1,2})?$/
  VALID_HEIGHT_REGEX = /^\d{2,3}$/

  validates :tell, presence: true, length: {minimum: 4, maximum:15},
  				   format: {with: VALID_TEL_REGEX}
  validates :cell, presence: true, length: {minimum: 4,maximum: 15},
  				   format: {with: VALID_CELL_REGEX}
  validates :religion, presence: true, length: {minimum: 2,maximum: 50}
  validates :religion_celebrations, presence: true, :inclusione => 1..3
  validates :height, presence: true, format: {with: VALID_HEIGHT_REGEX}
  validates :weight, presence: true, format: {with: VALID_WEIGHT_REGEX}
end
