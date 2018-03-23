class StorySerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user
  has_many :comments
  has_many :tags
end
