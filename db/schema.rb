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

ActiveRecord::Schema.define(version: 20150202084701) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "articles", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "babahomes", force: true do |t|
    t.string   "name"
    t.text     "intro"
    t.string   "phone"
    t.string   "address"
    t.integer  "country"
    t.integer  "city"
    t.integer  "district"
    t.text     "map_iframe"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "chapters", force: true do |t|
    t.string   "title"
    t.string   "status"
    t.integer  "sort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["country_id"], name: "index_cities_on_country_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "districts", force: true do |t|
    t.string   "name"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "districts", ["city_id"], name: "index_districts_on_city_id"

  create_table "honorees", force: true do |t|
    t.string   "name"
    t.string   "area"
    t.text     "content"
    t.string   "cover"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "prise_id"
  end

  create_table "instructions", force: true do |t|
    t.string   "title"
    t.integer  "article_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "intro_pages", force: true do |t|
    t.string   "title"
    t.string   "page_name"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "knowledges", force: true do |t|
    t.string   "title"
    t.integer  "article_id"
    t.string   "status"
    t.integer  "chapter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ministorages", force: true do |t|
    t.string   "name"
    t.text     "intro"
    t.string   "phone"
    t.string   "address"
    t.integer  "country"
    t.integer  "city"
    t.integer  "district"
    t.text     "map_iframe"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_id"
    t.text     "fb_meta_description"
  end

  create_table "notices", force: true do |t|
    t.string   "title"
    t.string   "area"
    t.text     "content"
    t.string   "compensation"
    t.string   "job_type"
    t.string   "shift"
    t.string   "holiday"
    t.string   "experience"
    t.string   "educated"
    t.string   "comment"
    t.string   "contact_name"
    t.string   "contact_phone"
    t.text     "contact_address"
    t.string   "contact_email"
    t.string   "notice_type"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "checked"
  end

  create_table "photos", force: true do |t|
    t.string   "image"
    t.string   "name"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "width"
    t.integer  "height"
  end

  create_table "prises", force: true do |t|
    t.string   "title"
    t.datetime "month"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recruits", force: true do |t|
    t.string   "name"
    t.integer  "notice_id"
    t.string   "sex"
    t.string   "birthday"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.string   "educated"
    t.string   "experience"
    t.text     "brief"
    t.string   "status"
    t.boolean  "checked"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", force: true do |t|
    t.string   "title"
    t.string   "cover"
    t.text     "items"
    t.integer  "article_id"
    t.string   "status"
    t.string   "external_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service_type"
  end

  create_table "simple_captcha_data", force: true do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "idx_key"

  create_table "tickets", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.text     "phone"
    t.string   "mobile"
    t.string   "address"
    t.string   "email"
    t.text     "services"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone_ext"
    t.string   "phone_area"
  end

end
