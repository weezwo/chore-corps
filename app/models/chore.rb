class Chore < ActiveRecord::Base
  belongs_to :family
  has_many :tasks

  def self.cycle_opts
    [["Daily", "86400"], ["Weekly","604800"], ["Monthly","2592000"], ["Seasonally", "7776000"], ["Yearly","31557600"]]
  end ## Numbers correspond to the number of seconds that should elapse between tasks

  def claimed_chore?
    tasks.any?{|task| task.completion_status == 'pending'}
  end

  def frequency
    pluralize self.cycle / 86400, "day"
  end
end
