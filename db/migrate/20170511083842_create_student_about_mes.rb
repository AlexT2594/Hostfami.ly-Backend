class CreateStudentAboutMes < ActiveRecord::Migration[5.0]
  def change
    create_table :student_about_mes do |t|
      t.integer :height
      t.integer :weight
      t.timestamps
    end
  end
end
