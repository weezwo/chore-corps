include ChoresHelper

class TasksController < ApplicationController
  def create
    t = Task.new(task_params)
    t.due_date = calculate_due_date(t.chore)
    t.save
    if claimed_chore?(t.chore)
      t.chore.tasks.where(completion_status: nil).each do |task|
        task.update(completion_status: "poached")
      end
    end
    redirect_to chore_path(t.chore)
  end

  def task_params
    params.require(:task).permit(:user_id, :chore_id)
  end
end
