# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121227141719) do

  create_table "attachments", :force => true do |t|
    t.string   "title"
    t.string   "file_name"
    t.integer  "state"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "attachments", ["project_id"], :name => "index_attachments_on_project_id"
  add_index "attachments", ["user_id"], :name => "index_attachments_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "skype"
    t.integer  "state"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "contacts", ["project_id"], :name => "index_contacts_on_project_id"

  create_table "efforts", :force => true do |t|
    t.string   "title"
    t.integer  "default_value"
    t.integer  "coefficient"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "efforts", ["user_id"], :name => "index_efforts_on_user_id"

  create_table "estimates", :force => true do |t|
    t.string   "title"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "estimates", ["project_id"], :name => "index_estimates_on_project_id"

  create_table "features", :force => true do |t|
    t.string   "title"
    t.string   "person"
    t.integer  "optimistic"
    t.integer  "most_likely"
    t.integer  "pessimistic"
    t.integer  "estimate_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "features", ["estimate_id"], :name => "index_features_on_estimate_id"

  create_table "links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "project_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["project_id"], :name => "index_links_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "projects_users", :id => false, :force => true do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id", "user_id"], :name => "index_projects_users_on_project_id_and_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "skype"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
