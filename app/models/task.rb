class Task < ApplicationRecord
  include TaskModelCollbacks

  belongs_to :project
  validates_presence_of :name
  before_update :readonly_error
  acts_as_list scope: :project
end
