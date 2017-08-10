class TasksController < ApplicationController
  def create
    t = Task.new(task_params)
    t.due_date = calculate_due_date(t.chore) # t.chore.last_completed + t.chore.cycle
    raise t.inspect
  end

  def task_params
    params.require(:task).permit(:user_id, :chore_id)
  end
end
