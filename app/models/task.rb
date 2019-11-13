# frozen_string_literal: true

class Task < ApplicationRecord
  include TaskModelCollbacks

  belongs_to :project
  has_many :comments, dependent: :destroy
  validates :name, presence: true
  before_update :readonly_error
  acts_as_list scope: :project
end
