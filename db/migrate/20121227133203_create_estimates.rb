class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :title
      t.integer :project_id

      t.timestamps
    end
    add_index :estimates, :project_id
  end
end
