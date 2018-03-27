class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :stories
  has_many :comments
end

def stories
  byebug
end
