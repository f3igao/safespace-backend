class Tag < ApplicationRecord
  has_many :stories_tags
  has_many :stories, through: :stories_tags
end
