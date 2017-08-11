module ChoresHelper
  def cycle_opts
    [["Daily", "86400"], ["Weekly","604800"], ["Monthly","2592000"], ["Seasonally", "7776000"], ["Yearly","31557600"]]
  end ## Numbers correspond to the number of seconds that should elapse between tasks

  def chore_frequency
    pluralize @chore.cycle / 86400, "day"
  end

  def claimed_chore?(chore)
    chore.tasks.any?{|task| task.completion_status == 'pending'}
  end

  def user_has_task?(chore)
    current_user.tasks.any?{|task| task.chore_id == chore.id  && task.completion_status == 'pending'}
  end

  def claimed_chore_notice

  end

  def overdue?(object)
    if object.respond_to? :due_date
      object.due_date < DateTime.now
    else
      calculate_due_date(object) < DateTime.now
    end
  end
end
