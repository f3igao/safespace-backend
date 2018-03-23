class StorySerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :user
  has_many :comments
  has_many :tags
end
