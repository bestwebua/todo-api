# frozen_string_literal: true

class ProjectSerializer < ApplicationSerializer
  attributes :id, :title, :created_at, :updated_at
  has_many :tasks
end
