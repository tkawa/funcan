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

ActiveRecord::Schema.define(:version => 20111017040646) do

  create_table "comments", :force => true do |t|
    t.string   "text",       :default => "", :null => false
    t.integer  "funcan_id"
    t.integer  "user_id"
    t.string   "sid",                        :null => false
    t.string   "uid",                        :null => false
    t.integer  "quantity",   :default => 0,  :null => false
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["sid", "user_id", "type"], :name => "index_comments_on_sid_and_user_id_and_type"

  create_table "funcans", :force => true do |t|
    t.string   "sid",                              :null => false
    t.integer  "comments_count",    :default => 0, :null => false
    t.integer  "like_count",        :default => 0, :null => false
    t.integer  "want_count",        :default => 0, :null => false
    t.integer  "great_count",       :default => 0, :null => false
    t.integer  "interesting_count", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "funcans", ["sid"], :name => "index_funcans_on_sid", :unique => true

  create_table "users", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "screen_name", :null => false
    t.string   "uid",         :null => false
    t.string   "provider",    :null => false
    t.string   "token",       :null => false
    t.string   "secret",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["provider", "uid"], :name => "index_users_on_provider_and_uid"
  add_index "users", ["screen_name"], :name => "index_users_on_screen_name"

end
