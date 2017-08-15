class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore

  scope :complete, -> { where(completion_status: 'complete') }

  def self.last_completed
    Task.complete.order('completion_date desc').first
  end
end
