class AddFieldsToPressitem < ActiveRecord::Migration[5.0]
  def change
    add_column :pressitems, :title, :string
    add_column :pressitems, :link, :string
    add_column :pressitems, :sitename, :string
    add_column :pressitems, :body, :text
    add_column :pressitems, :image, :string
  end
end
