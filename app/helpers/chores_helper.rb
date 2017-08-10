module ChoresHelper
  def cycle_opts
    [["Daily", "86400"], ["Weekly","604800"], ["Monthly","2592000"], ["Seasonally", "7776000"], ["Yearly","31557600"]]
  end ## Numbers correspond to the number of seconds that should elapse between tasks

  def chore_frequency
    pluralize @chore.cycle / 86400, "day"
  end

  def claimed_chore?(chore)
    chore.tasks.any?{|task| task.completion_status.nil?}
  end

  def claimed_chore_notice

  end
end
