class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :password_digest
      t.string :country
      t.string :city
      t.date   :birthday
      t.string :gender
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
