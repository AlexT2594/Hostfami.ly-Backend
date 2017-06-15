class CreateStudentAboutMes < ActiveRecord::Migration[5.0]
  def change
    create_table :student_about_mes do |t|
      t.belongs_to :student, index: true
      t.string :tell
      t.string :cell
      t.string :religion
      t.string :tutor_email
      t.integer :religion_celebrations
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
