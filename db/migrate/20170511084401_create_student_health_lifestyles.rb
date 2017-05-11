class CreateStudentHealthLifestyles < ActiveRecord::Migration[5.0]
  def change
    create_table :student_health_lifestyles do |t|

      t.timestamps
    end
  end
end
