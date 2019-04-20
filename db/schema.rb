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

ActiveRecord::Schema.define(version: 2019_04_19_205450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "canvas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "currentGameId"
    t.integer "prevX"
    t.integer "currX"
    t.integer "prevY"
    t.integer "currY"
    t.integer "prevXArray", default: [], array: true
    t.integer "prevYArray", default: [], array: true
    t.integer "currXArray", default: [], array: true
    t.integer "currYArray", default: [], array: true
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.boolean "is_won"
    t.bigint "drawer_id"
    t.bigint "guesser_id"
    t.string "answer"
    t.string "guesses", default: [], array: true
    t.string "rejectList", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["drawer_id"], name: "index_games_on_drawer_id"
    t.index ["guesser_id"], name: "index_games_on_guesser_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
