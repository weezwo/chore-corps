class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :chore

  validates name: presence: true
end
