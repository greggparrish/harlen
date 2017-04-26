class AddSlugToPressitem < ActiveRecord::Migration[5.0]
  def change
    add_column :pressitems, :slug, :string
    add_index :pressitems, :slug, unique: true
  end
end
