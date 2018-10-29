class Task < ApplicationRecord
  include TaskModelCollbacks

  belongs_to :project
  validates_presence_of :name, :position
  before_update :readonly_error
end
