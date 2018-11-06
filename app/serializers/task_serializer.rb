class TaskSerializer < ActiveModel::Serializer
  attributes :id, :name, :done, :deadline, :position, :created_at, :updated_at
  has_many :comments
end
