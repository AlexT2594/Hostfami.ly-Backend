class CreateStudentHealthLifestyles < ActiveRecord::Migration[5.0]
  def change
    create_table :student_health_lifestyles do |t|
      t.belongs_to :student, index: true
      t.boolean :allergies
      t.boolean :handicaps
      t.boolean :pets
      t.boolean :diet
      t.boolean :smoking

      t.timestamps
    end
  end
end
