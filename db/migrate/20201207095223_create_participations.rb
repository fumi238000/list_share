class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.integer :owner_id, null: false
      t.integer :participation_id, null: false 
      t.integer :category, null: false

      t.timestamps
    end
  end
end
