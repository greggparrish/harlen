class CreatePressitems < ActiveRecord::Migration[5.0]
  def change
    create_table :pressitems do |t|

      t.timestamps
    end
  end
end
