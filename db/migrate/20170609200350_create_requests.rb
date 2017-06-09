class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
    	t.belongs_to :student, index: true
    	t.belongs_to :family, index:true
    	t.string :state

      t.timestamps
    end
  end
end
