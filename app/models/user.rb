class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :family
  has_many :tasks
  has_many :chores, through: :tasks

  def pending_tasks
    self.tasks.select {|task| task.completion_status.nil?}
  end
end
