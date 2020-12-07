class CreateParticipations < ActiveRecord::Migration[6.0]
  def change
    create_table :participations do |t|
      t.string :owner_id
      t.string :participation_id
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
