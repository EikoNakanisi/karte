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

ActiveRecord::Schema.define(version: 20180506103222) do

  create_table "kansatus", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "category"
    t.string   "ob_name"
    t.string   "n_1d"
    t.string   "j_1d"
    t.string   "s_2d"
    t.string   "n_2d"
    t.string   "j_2d"
    t.string   "s_3d"
    t.string   "n_3d"
    t.string   "j_3d"
    t.string   "s_4d"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "p_name"
    t.string   "p_kana"
    t.datetime "hos_date"
    t.string   "room_no"
    t.date     "birth_date"
    t.integer  "age"
    t.integer  "gender"
    t.string   "diagnosis"
    t.string   "med_history"
    t.integer  "bloodtype"
    t.float    "height",        limit: 24
    t.float    "weight",        limit: 24
    t.string   "infection"
    t.string   "allergic"
    t.integer  "aid"
    t.string   "attention"
    t.string   "post"
    t.string   "address"
    t.string   "wish"
    t.string   "notice"
    t.string   "recognition"
    t.string   "life"
    t.integer  "ps"
    t.integer  "hand_mmt"
    t.integer  "foot_mmt"
    t.string   "vision"
    t.string   "hearing"
    t.string   "verbal"
    t.string   "skin"
    t.string   "excretion"
    t.string   "iadl"
    t.string   "consciousness"
    t.string   "understanding"
    t.string   "keyp1"
    t.string   "connection"
    t.string   "family"
    t.string   "house"
    t.string   "impact"
    t.string   "relationship"
    t.string   "friend"
    t.string   "occupation"
    t.string   "position"
    t.string   "good_p"
    t.string   "bad_p"
    t.string   "value"
    t.string   "hobby"
    t.string   "anniversary"
    t.string   "fa_prob"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tentous", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "patient_id"
    t.date     "kisaibi"
    t.integer  "age"
    t.integer  "kiou"
    t.integer  "katudou"
    t.integer  "ninsiki"
    t.integer  "haisetu"
    t.integer  "med1"
    t.integer  "med2"
    t.integer  "med3"
    t.integer  "med4"
    t.integer  "med5"
    t.integer  "kankyo1"
    t.integer  "kankyo2"
    t.integer  "goukei"
    t.integer  "kikendo"
    t.string   "yobou"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "email"
    t.string   "section"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
