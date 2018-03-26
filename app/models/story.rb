class Story < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :stories_tags
  has_many :tags, through: :stories_tags

  accepts_nested_attributes_for :stories_tags

  def autosave_associated_records_for_stories_tags
    stories_tags.each do |st|
      if new_tag = Tag.find_by(name:st.tag.name)
        st.tag = new_tag
      else
        st.tag.save!
      end
      st.story = self
      st.save!
    end
  end


end
