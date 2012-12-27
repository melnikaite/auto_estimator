class CreateEfforts < ActiveRecord::Migration
  def change
    create_table :efforts do |t|
      t.string :title
      t.integer :default_value
      t.integer :coefficient
      t.integer :user_id

      t.timestamps
    end
    add_index :efforts, :user_id
  end
end
