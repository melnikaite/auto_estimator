class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :skype
      t.integer :state
      t.integer :project_id

      t.timestamps
    end
    add_index :contacts, :project_id
  end
end
