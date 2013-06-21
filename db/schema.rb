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

ActiveRecord::Schema.define(version: 20130620210733) do

  create_table "base_data", force: true do |t|
    t.string   "category_name"
    t.string   "brand"
    t.string   "code"
    t.string   "description"
    t.string   "details"
    t.string   "size"
    t.decimal  "price",         precision: 8, scale: 2
    t.boolean  "vat"
    t.decimal  "rrp",           precision: 8, scale: 2
    t.boolean  "b"
    t.boolean  "f"
    t.boolean  "g"
    t.boolean  "o"
    t.boolean  "s"
    t.boolean  "v"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.string   "details"
    t.decimal  "price",       precision: 8, scale: 2
    t.decimal  "rrp",         precision: 8, scale: 2
    t.string   "size"
    t.integer  "category_id"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "items", ["code"], name: "index_items_on_code", unique: true

end
