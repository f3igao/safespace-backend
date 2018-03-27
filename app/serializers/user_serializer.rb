class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :stories, include_nested_associations: true
  has_many :comments
end
