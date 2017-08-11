module ChoresHelper

  def user_has_task?(chore)
    current_user.tasks.any?{|task| task.chore_id == chore.id  && task.completion_status == 'pending'}
  end

  def claimed_chore_notice

  end

  def format_frequency(chore)
    pluralize chore.frequency, "day"
  end

  def overdue?(object)
    if object.respond_to? :due_date
      object.due_date < DateTime.now
    else
      calculate_due_date(object) < DateTime.now
    end
  end
end
