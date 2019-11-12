# frozen_string_literal: true

class CommentSerializer < ApplicationSerializer
  attributes :id, :body, :img_src, :created_at
end
