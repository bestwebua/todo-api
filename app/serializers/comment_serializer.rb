class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :img_src, :created_at
end
