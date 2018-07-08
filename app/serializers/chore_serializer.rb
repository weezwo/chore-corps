class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :cycle, :last_completed, :notes, :due_date, :created_at, :updated_at
  has_many :tasks
end
