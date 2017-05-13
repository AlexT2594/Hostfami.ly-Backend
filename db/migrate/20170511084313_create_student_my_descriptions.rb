class CreateStudentMyDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :student_my_descriptions do |t|
      t.belongs_to :student, index: true

      t.timestamps
    end
  end
end
