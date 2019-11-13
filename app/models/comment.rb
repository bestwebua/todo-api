# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :task
  validates :body, presence: true
  has_one_attached :image
  validates :image, blob: { content_type: :image }
end
