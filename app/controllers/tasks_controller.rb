include ChoresHelper

class TasksController < ApplicationController
  def create
    t = Task.new(task_params)
    if claimed_chore?(t.chore)
      t.chore.tasks.where(completion_status: nil).each do |task|
        task.update(completion_status: "poached")
      end
    end
    t.completion_status = nil
    t.due_date = calculate_due_date(t.chore)
    t.save
    redirect_to chore_path(t.chore)
  end

  def update
    t = Task.find(params[:id])
    if t.user == current_user
      t.update(completion_status: 'complete', completion_date: DateTime.now)
      t.chore.update(last_completed: DateTime.now)
    end
    redirect_to :back
  end

  private
  def task_params
    params.require(:task).permit(:user_id, :chore_id)
  end
end
