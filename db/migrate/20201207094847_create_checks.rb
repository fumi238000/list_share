# frozen_string_literal: true

class CreateChecks < ActiveRecord::Migration[6.0]
  def change
    create_table :checks do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :task_id, null: false

      t.timestamps
      # add_index :checks, [:user_id, :task_id], unique: true
    end
  end
end
