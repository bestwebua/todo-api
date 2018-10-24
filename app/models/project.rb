class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates_presence_of :title
end
