class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :type
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :gender
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
