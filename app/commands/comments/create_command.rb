# frozen_string_literal: true

module Comments
  class CreateCommand
    def self.call(task_object, comment_params)
      comment = task_object.comments.create!(comment_params)
      comment.update(img_src: Rails.application.routes.url_helpers.url_for(comment.image)) if comment.image.attached?
      comment
    end
  end
end
