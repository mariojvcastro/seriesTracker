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

ActiveRecord::Schema.define(:version => 20111210175707) do

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.date     "inair"
    t.integer  "season_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number"
    t.string   "screen_cap"
  end

  create_table "messages", :force => true do |t|
    t.integer  "to_id"
    t.integer  "from_id"
    t.datetime "date"
    t.string   "subject"
    t.text     "content"
    t.boolean  "bdeleted_from", :default => false
    t.boolean  "bdeleted_to",   :default => false
    t.boolean  "bread_from",    :default => false
    t.boolean  "bread_to",      :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["from_id"], :name => "index_messages_on_from_id"
  add_index "messages", ["to_id"], :name => "index_messages_on_to_id"

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seasons", :force => true do |t|
    t.integer  "number"
    t.integer  "series_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "series", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tvrage_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status"
    t.integer  "runtime"
    t.string   "image_url"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.string   "nationality"
    t.string   "city"
    t.date     "birthday"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reset_password_code"
    t.datetime "reset_password_code_until"
  end

end
