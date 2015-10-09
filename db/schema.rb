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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151009224502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_books", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "author_books", ["author_id"], name: "index_author_books_on_author_id", using: :btree
  add_index "author_books", ["book_id"], name: "index_author_books_on_book_id", using: :btree

  create_table "authors", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checkouts", force: :cascade do |t|
    t.date     "start_date"
    t.date     "date_returned"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "book_id"
  end

  add_index "checkouts", ["book_id"], name: "index_checkouts_on_book_id", using: :btree

  create_table "counties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "county_memberships", force: :cascade do |t|
    t.integer  "county_id"
    t.integer  "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "county_memberships", ["county_id"], name: "index_county_memberships_on_county_id", using: :btree
  add_index "county_memberships", ["member_id"], name: "index_county_memberships_on_member_id", using: :btree

  create_table "genres", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "libraries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "county_id"
  end

  add_index "libraries", ["county_id"], name: "index_libraries_on_county_id", using: :btree

  create_table "library_books", force: :cascade do |t|
    t.integer  "library_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "library_books", ["book_id"], name: "index_library_books_on_book_id", using: :btree
  add_index "library_books", ["library_id"], name: "index_library_books_on_library_id", using: :btree

  create_table "member_checkouts", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "checkout_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "member_checkouts", ["checkout_id"], name: "index_member_checkouts_on_checkout_id", using: :btree
  add_index "member_checkouts", ["member_id"], name: "index_member_checkouts_on_member_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "author_books", "authors"
  add_foreign_key "author_books", "books"
  add_foreign_key "checkouts", "books"
  add_foreign_key "county_memberships", "counties"
  add_foreign_key "county_memberships", "members"
  add_foreign_key "libraries", "counties"
  add_foreign_key "library_books", "books"
  add_foreign_key "library_books", "libraries"
  add_foreign_key "member_checkouts", "checkouts"
  add_foreign_key "member_checkouts", "members"
end
