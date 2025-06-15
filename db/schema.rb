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

ActiveRecord::Schema[7.2].define(version: 2025_06_15_034922) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "endings", force: :cascade do |t|
    t.string "key"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "puzzles", force: :cascade do |t|
    t.string "question"
    t.string "option_a"
    t.string "option_b"
    t.string "option_c"
    t.string "correct_option"
    t.text "explanation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "next_room_id"
    t.integer "back_room_id"
    t.integer "puzzle_id"
    t.boolean "is_ending", default: false
    t.string "ending_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
