class CreateStudentPassportInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :student_passport_infos do |t|
      t.belongs_to :student, index: true
      t.string :firstname
      t.string :lastname
      t.string :number
      t.date :release
      t.date :expiration
      t.string :birth_country

      t.timestamps
    end
  end
end
