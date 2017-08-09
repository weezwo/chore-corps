class Family < ActiveRecord::Base
  has_many :users
  has_many :chores
  has_secure_password
end
