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

ActiveRecord::Schema.define(version: 2019_07_08_014342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "companies", force: :cascade do |t|
    t.string "name"
  end

  create_table "complains", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "lat"
    t.string "long"
    t.bigint "company_id"
    t.bigint "locale_id"
    t.index ["company_id"], name: "index_complains_on_company_id"
    t.index ["locale_id"], name: "index_complains_on_locale_id"
  end

  create_table "locales", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.string "country"
  end

end
