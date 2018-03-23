class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :story
  belongs_to :user
end
