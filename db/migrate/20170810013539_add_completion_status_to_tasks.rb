class AddCompletionStatusToTasks < ActiveRecord::Migration
  def change
    add_column(:tasks, :completion_status, :string)
  end
end
