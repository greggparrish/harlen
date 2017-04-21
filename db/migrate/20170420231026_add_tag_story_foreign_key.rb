class AddTagStoryForeignKey < ActiveRecord::Migration[5.0]
  def change
    add_reference :tags, :story, index: true
    add_foreign_key :tags, :stories
  end
end
