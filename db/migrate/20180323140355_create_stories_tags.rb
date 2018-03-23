class CreateStoriesTags < ActiveRecord::Migration[5.1]
  def change
    create_table :stories_tags, id:false do |t|
      t.integer :story_id
      t.integer :tag_id
    end
  end
end
