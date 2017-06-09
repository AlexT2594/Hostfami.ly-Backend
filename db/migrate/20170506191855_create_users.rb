class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :type # set automatically by rails
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :birthday
      t.string :state
      t.string :city
      t.string :address
      t.string :password_digest
      t.string :gender
      t.boolean :email_confirmed, default: false
      t.string :confirm_token
      t.boolean :forms_filled, default: false

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :confirm_token, unique: true
  end
end
