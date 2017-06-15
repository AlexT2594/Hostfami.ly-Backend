class CreateFamilyHealthLifestyles < ActiveRecord::Migration[5.0]
  def change
    create_table :family_health_lifestyles do |t|
      t.belongs_to :family, index: true
      t.boolean :allergies
      t.boolean :handicaps
      t.boolean :pets
      t.boolean :diet
      t.boolean :smoking

      t.timestamps
    end
  end
end
