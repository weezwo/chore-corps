class AddDueDateToChores < ActiveRecord::Migration
  def change
    add_column :chores, :due_date, :datetime
  end
end
