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

ActiveRecord::Schema.define(version: 20170612215156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table "puzzles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "square_value_max"
    t.boolean  "complete",         default: false, null: false
    t.json     "final_values",     default: {},    null: false
    t.index ["id"], name: "index_puzzles_on_id", using: :btree
  end

  create_table "squares", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "value"
    t.uuid     "puzzle_id"
    t.integer  "position",                array: true
    t.index ["id"], name: "index_squares_on_id", using: :btree
    t.index ["position"], name: "index_squares_on_position", using: :btree
    t.index ["puzzle_id"], name: "index_squares_on_puzzle_id", using: :btree
  end

  add_foreign_key "squares", "puzzles"
end
