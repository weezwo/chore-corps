class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :cycle, :last_completed, :notes, :created_at, :updated_at
  has_many :tasks
end
