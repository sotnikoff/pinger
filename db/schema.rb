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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_05_16_121800) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "node_pings", force: :cascade do |t|
    t.bigint "node_id"
    t.boolean "result"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_attempts", default: 0
    t.integer "successful_attempts", default: 0
    t.index ["created_at"], name: "index_node_pings_on_created_at"
    t.index ["node_id"], name: "index_node_pings_on_node_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.string "title"
    t.string "ip"
    t.text "description"
    t.integer "ems_id"
    t.boolean "check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "discarded_at"
    t.boolean "node_online", default: true
    t.index ["discarded_at"], name: "index_nodes_on_discarded_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "receive_mails", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
