class CreateVolunteerAboutMes < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteer_about_mes do |t|
      t.belongs_to :volunteer, index: true
      t.timestamps
    end
  end
end
