class CreateStudentPassportInfos < ActiveRecord::Migration[5.0]
  def change
    create_table :student_passport_infos do |t|

      t.timestamps
    end
  end
end
