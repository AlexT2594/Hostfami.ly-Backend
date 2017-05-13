class CreateFamilyAbouts < ActiveRecord::Migration[5.0]
  def change
    create_table :family_abouts do |t|
      t.belongs_to :family

      t.timestamps
    end
  end
end
