class TaskSerializer < ActiveModel::Serializer
  attributes :id, :due_date, :completion_status, :completion_date, :created_at, :updated_at
  belongs_to :chore
  belongs_to :user
end
