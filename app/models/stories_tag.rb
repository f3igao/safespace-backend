class StoriesTag < ApplicationRecord
  belongs_to :story
  belongs_to :tag

  accepts_nested_attributes_for :tag

  
end
