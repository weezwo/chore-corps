class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :handle 
      t.string :name

      t.timestamps null: false
    end
  end
end
