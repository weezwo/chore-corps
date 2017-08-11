class ChangeCompletionStatusInTasks < ActiveRecord::Migration
  def change
    change_column :tasks, :completion_status, :string, :default => "pending"
  end
end
