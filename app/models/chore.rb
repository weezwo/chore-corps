class Chore < ActiveRecord::Base
  belongs_to :family
  has_many :tasks
end
