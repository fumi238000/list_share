class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.string :owner_id, null: false
      t.string :participation_id, null: false 
      t.string :category, null: false

      t.timestamps
    end
  end
end
