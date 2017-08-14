class Family < ActiveRecord::Base
  has_many :users
  has_many :chores
  has_secure_password

  validates :name, uniqueness: true
  validates :password, length: {minimum: 8}

  def chores_by_due_date
    chores.sort{|chore| calculate_due_date(chore)}
  end
end
