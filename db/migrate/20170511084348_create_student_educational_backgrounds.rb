class CreateStudentEducationalBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :student_educational_backgrounds do |t|
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
