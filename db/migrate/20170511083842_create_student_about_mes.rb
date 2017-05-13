class CreateStudentAboutMes < ActiveRecord::Migration[5.0]
  def change
    create_table :student_about_mes do |t|
      t.belongs_to :student, index: true
      t.date   :birthday
      t.string :birthday_country
      t.string :country_living
      t.string :gender
      t.integer :religion_celebrations
      t.boolean :same_religion_hosting
      t.integer :height
      t.integer :weight

      t.timestamps
    end
  end
end
