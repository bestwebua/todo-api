# frozen_string_literal: true

module Comments
  class CreateCommand
    def self.call(task_object, comment_params)
      comment = task_object.comments.create!(comment_params)
      image = comment.image
      comment.update(img_src: Rails.application.routes.url_helpers.url_for(image)) if image.attached?
      comment
    end
  end
end
