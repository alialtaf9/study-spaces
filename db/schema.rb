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

ActiveRecord::Schema.define(:version => 20130907104200) do

  create_table "buildings", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

# Could not dump table "main_buildings" because of following StandardError
#   Unknown type 'has_many' for column 'study_locations'

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.string   "text"
    t.integer  "user_id"
    t.integer  "room_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["room_id"], :name => "index_posts_on_room_id"
  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "rooms", :force => true do |t|
    t.string   "name"
    t.integer  "building_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "rooms", ["building_id"], :name => "index_rooms_on_building_id"

# Could not dump table "study_locations" because of following StandardError
#   Unknown type 'belongs_to' for column 'main_building'

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "facebook_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "room_id"
  end

  add_index "users", ["room_id"], :name => "index_users_on_room_id"

end
