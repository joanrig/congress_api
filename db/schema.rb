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

ActiveRecord::Schema.define(version: 2019_08_16_164557) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "asset_reports", force: :cascade do |t|
    t.integer "member_id"
    t.string "crp_id"
    t.integer "data_year"
    t.integer "net_low"
    t.integer "net_high"
    t.integer "asset_count"
    t.integer "asset_low"
    t.integer "asset_high"
    t.string "source"
    t.string "origin"
  end

  create_table "assets", force: :cascade do |t|
    t.integer "asset_report_id"
    t.string "name"
    t.integer "holdings_low"
    t.integer "holdings_high"
    t.string "industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bills", force: :cascade do |t|
    t.integer "member_id"
    t.boolean "active"
    t.string "congress"
    t.string "bill_id"
    t.string "bill_type"
    t.string "color"
    t.string "number"
    t.string "title"
    t.string "short_title"
    t.string "sponsor_id"
    t.string "govtrack_url"
    t.string "introduced_date"
    t.string "last_vote"
    t.boolean "house_passage"
    t.boolean "senate_passage"
    t.boolean "enacted"
    t.boolean "vetoed"
    t.integer "cosponsors"
    t.text "cosponsors_by_party"
    t.text "committees"
    t.string "primary_subject"
  end

  create_table "donors", force: :cascade do |t|
    t.integer "financial_disclosure_id"
    t.string "org_name"
    t.integer "total"
    t.integer "pacs"
    t.integer "indivs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financial_disclosures", force: :cascade do |t|
    t.integer "member_id"
    t.string "cid"
    t.string "cand_name"
    t.string "cycle"
    t.string "origin"
    t.string "source"
    t.string "notice"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "chamber"
    t.string "propublica_id"
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
    t.string "phone_clickable"
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
    t.string "status"
    t.string "status_note"
    t.string "crp_id"
    t.string "full_name"
    t.string "title_and_name"
    t.string "search_term"
  end

end
