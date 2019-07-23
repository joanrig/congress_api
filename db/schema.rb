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

ActiveRecord::Schema.define(version: 2019_07_23_041508) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "members", force: :cascade do |t|
    t.string "chamber"
    t.integer "propublica_id"
    t.string "title"
    t.string "short_title"
    t.string "first_name"
    t.string "last_name"
    t.string "date_of_birth"
    t.string "gender"
    t.string "gender_search_term"
    t.string "party"
    t.string "party_full_name"
    t.string "party_logo"
    t.string "image_url"
    t.string "twitter_account"
    t.string "facebook_account"
    t.string "youtube_account"
    t.string "website"
    t.string "contact_form"
    t.integer "seniority"
    t.string "next_election"
    t.string "office"
    t.string "phone"
    t.string "state"
    t.string "state_full_name"
    t.string "district"
    t.decimal "missed_votes_pct"
    t.decimal "votes_with_party_pct"
    t.string "favorite", default: "no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
    t.string "twitter_handle"
    t.boolean "running_for_president"
  end

end
