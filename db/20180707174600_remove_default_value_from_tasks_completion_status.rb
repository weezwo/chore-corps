class RemoveDefaultValueFromTasksCompletionStatus < ActiveRecord::Migration
  def change
    change_column_default(:tasks, :completion_status, nil)
  end
end
