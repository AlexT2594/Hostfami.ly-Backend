class CreateUserProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :user_profiles do |t|

      t.belongs_to :user, index: {unique: true}, foreign_key: true

      t.string :utype
      t.string :name
      t.string :last_name
      t.string :country
      t.string :city
      t.string :gender
    end
  end
end
