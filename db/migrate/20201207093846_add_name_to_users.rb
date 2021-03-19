# frozen_string_literal: true

class AddNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name,  :string, null: false
    add_column :users, :image, :string, default: ""
  end
end
