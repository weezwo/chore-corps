class Family < ActiveRecord::Base
  validates :family_code_digest, uniqueness: true

  before_save :generate_family_code
end
