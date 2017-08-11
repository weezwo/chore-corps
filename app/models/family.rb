class Family < ActiveRecord::Base
  has_many :users
  has_many :chores
  has_secure_password

  def chores_by_due_date
    chores.sort{|chore| calculate_due_date(chore)}
  end
end
