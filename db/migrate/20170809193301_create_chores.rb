class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :name
      t.integer :family_id
      t.integer :cycle
      t.datetime :last_completed
      t.timestamps null: false
    end
  end
end
