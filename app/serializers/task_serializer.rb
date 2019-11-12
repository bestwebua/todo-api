# frozen_string_literal: true

class TaskSerializer < ApplicationSerializer
  attributes :id, :name, :done, :deadline, :position, :created_at, :updated_at
  has_many :comments
end
