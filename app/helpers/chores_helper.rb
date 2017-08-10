module ChoresHelper
  def cycle_opts
    [["Daily", "86400"], ["Weekly","604800"], ["Monthly","2592000"], ["Seasonally", "7776000"], ["Yearly","31557600"]]
  end

  def chore_frequency
    pluralize @chore.cycle / 86400, "day"
  end

end
