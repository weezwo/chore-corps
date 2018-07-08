class Chore < ActiveRecord::Base
  belongs_to :family
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :due_date, absence: {unless: -> {self.cycle.nil?}, message: "must be blank for cycled chores" }
  validates :due_date, presence: {if: -> {self.cycle.nil?}, message: "must be present for one-off chores"}

  scope :uncycled, -> { where(cycle: nil)}
  scope :cycled, -> { where.not(id: uncycled) }
  scope :undisplayable, -> {where.not(last_completed: nil).where.not(due_date: nil)}
  scope :displayable, -> { where.not(id: undisplayable)}

  def self.by_due_date
    uncycled + cycled.sort_by{|chore| chore.calculate_due_date}
  end

  def calculate_due_date
    due_date || (self.last_completed || self.created_at) + self.cycle.seconds
  end

  def self.cycle_opts
    [["Daily", "86400"], ["Weekly","604800"], ["Bi-Weekly","1209600"], ["Monthly","2592000"], ["Seasonally", "7776000"], ["Yearly","31557600"], ["One-off", ""]]
  end ## Numbers correspond to the number of seconds that should elapse between tasks

  def claimed_chore?
    tasks.where(completion_status: "pending").count > 0
  end

  def frequency
    cycle / 86400
  end
end
