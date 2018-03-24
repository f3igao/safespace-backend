class Story < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :stories_tags
  has_many :tags, through: :stories_tags

  accepts_nested_attributes_for :stories_tags


end
