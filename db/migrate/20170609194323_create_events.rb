class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
    	t.string :title
    	t.string :place
    	t.string :description
    	t.date :date

      t.timestamps
    end
  end
end
