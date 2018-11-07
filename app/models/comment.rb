class Comment < ApplicationRecord
  belongs_to :task
  validates_presence_of :body
  has_one_attached :image
  validates :image, blob: { content_type: :image }
end
