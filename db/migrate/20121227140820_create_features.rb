class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.string :person
      t.integer :optimistic
      t.integer :most_likely
      t.integer :pessimistic
      t.integer :estimate_id

      t.timestamps
    end
    add_index :features, :estimate_id
  end
end
