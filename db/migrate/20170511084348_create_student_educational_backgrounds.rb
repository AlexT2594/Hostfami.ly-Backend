class CreateStudentEducationalBackgrounds < ActiveRecord::Migration[5.0]
  def change
    create_table :student_educational_backgrounds do |t|
      t.belongs_to :student, index: true
      t.string :school
      t.date :from
      t.date :to
      t.string :description
      t.boolean :graduated
      t.string :mother_language

      t.timestamps
    end
  end
end
