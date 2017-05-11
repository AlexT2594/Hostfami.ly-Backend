class CreateStudentProgramPreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :student_program_preferences do |t|

      t.timestamps
    end
  end
end
