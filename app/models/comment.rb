class Comment < ApplicationRecord
  belongs_to :task
  validates_presence_of :body
end
