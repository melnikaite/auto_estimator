class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :title
      t.string :file_name
      t.integer :state
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
    add_index :attachments, :user_id
    add_index :attachments, :project_id
  end
end
