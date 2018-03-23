class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at, :username
  belongs_to :story
  belongs_to :user

  def username
    object.user.username
  end
end
