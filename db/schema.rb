# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_06_17_044303) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "choices", force: :cascade do |t|
    t.bigint "room_id", null: false
    t.bigint "next_room_id", null: false
    t.string "description", null: false
    t.text "condition"
    t.boolean "is_backtrack", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_room_id"], name: "index_choices_on_next_room_id"
    t.index ["room_id"], name: "index_choices_on_room_id"
  end

  create_table "endings", force: :cascade do |t|
    t.string "key", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "theme_color"
    t.text "condition"
    t.index ["key"], name: "index_endings_on_key", unique: true
  end

  create_table "game_states", force: :cascade do |t|
    t.bigint "current_room_id", null: false
    t.json "flags", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["current_room_id"], name: "index_game_states_on_current_room_id"
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "question", null: false
    t.string "correct_option", null: false
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", null: false
    t.bigint "room_id"
    t.json "choices", default: [], null: false
    t.index ["room_id"], name: "index_puzzles_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.integer "puzzle_id"
    t.boolean "is_ending", default: false
    t.string "ending_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "room_type", default: 1, null: false
    t.boolean "is_dark", default: false
    t.boolean "requires_item", default: false
  end

  add_foreign_key "choices", "rooms"
  add_foreign_key "choices", "rooms", column: "next_room_id"
  add_foreign_key "game_states", "rooms", column: "current_room_id"
  add_foreign_key "puzzles", "rooms"
end
