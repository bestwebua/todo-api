class Task < ApplicationRecord
  include TaskModelCollbacks

  belongs_to :project
  has_many :comments, dependent: :destroy
  validates_presence_of :name
  before_update :readonly_error
  acts_as_list scope: :project
end
