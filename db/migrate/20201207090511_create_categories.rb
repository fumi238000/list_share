class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.references :user, null: false
      t.string :name ,null:false
      t.integer :position

      t.timestamps
    end
  end
end
