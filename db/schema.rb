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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20170614093744) do

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "number_of_reviews"
    t.float    "controversy"
    t.integer  "rating"
    t.text     "description"
  end

  create_table "company_votes", :force => true do |t|
    t.integer  "vote"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "company_votes", ["company_id"], :name => "index_company_votes_on_company_id"

  create_table "review_votes", :force => true do |t|
    t.integer  "vote"
    t.integer  "review_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "review_votes", ["review_id"], :name => "index_review_votes_on_review_id"

  create_table "reviews", :force => true do |t|
    t.text     "body"
    t.integer  "company_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
    t.string   "title"
    t.integer  "score"
  end

  add_index "reviews", ["company_id"], :name => "index_posts_on_company_id"

end
