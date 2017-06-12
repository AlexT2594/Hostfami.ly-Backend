class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
    	t.string :student_id
    	t.string :family_id
    	t.string :state, default: "Pending"
      t.timestamps
    end
  end
end
