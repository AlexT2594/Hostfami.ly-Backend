class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
    	t.belongs_to :student, optional: true
    	t.belongs_to :family, optional: true
    	t.string :status, default: "Pending"
      t.string :family_lastname
      t.string :student_fullname
      t.string :student_state
      t.string :student_city
      t.string :family_city
      t.timestamps
    end
  end
end
