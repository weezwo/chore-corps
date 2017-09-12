class Family < ActiveRecord::Base
  has_many :users
  has_many :chores
  has_secure_password

  validates :name, uniqueness: true
  validates :password, length: {minimum: 8}

  def users_attributes=(users_attributes)
    users_attributes.values.each do |user_attributes|
      self.users.build(user_attributes)
    end
  end

  def chores_by_due_date
    chores.sort_by{|chore| chore.calculate_due_date}
  end

  def most_completed_chore
    chores.sort_by{|chore| chore.tasks.size}.reverse.first
  end
end
