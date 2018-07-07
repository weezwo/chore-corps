class Chore < ActiveRecord::Base
  belongs_to :family
  has_many :tasks, dependent: :destroy

  validates :name, presence: true

  def calculate_due_date
    (self.last_completed || self.created_at) + self.cycle.seconds
  end

  def self.cycle_opts
    [["Daily", "86400"], ["Weekly","604800"], ["Bi-Weekly","1209600"], ["Monthly","2592000"], ["Seasonally", "7776000"], ["Yearly","31557600"]]
  end ## Numbers correspond to the number of seconds that should elapse between tasks

  def claimed_chore?
    tasks.where(completion_status: "pending").count > 0
  end

  def frequency
    cycle / 86400
  end
end
