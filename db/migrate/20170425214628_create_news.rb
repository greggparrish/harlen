class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.string :image
      t.string :link
      t.string :site
      t.text :body

      t.timestamps
    end
  end
end
