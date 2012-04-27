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

ActiveRecord::Schema.define(:version => 20120420155825) do

  create_table "events", :force => true do |t|
    t.string  "name"
    t.string  "description"
    t.string  "address"
    t.string  "city"
    t.string  "state"
    t.integer "user_id"
    t.date    "date"
  end

  create_table "houses", :force => true do |t|
    t.string   "street"
    t.integer  "number"
    t.string   "complement"
    t.string   "neightborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "offerings", :force => true do |t|
    t.integer  "event_id"
    t.integer  "space_id"
    t.decimal  "price",      :precision => 10, :scale => 2
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "questions", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.integer  "offering_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resources", :force => true do |t|
    t.boolean  "breakfast"
    t.boolean  "lunch"
    t.boolean  "dinner"
    t.boolean  "private_bathroon"
    t.boolean  "private_space"
    t.integer  "parking_spaces"
    t.string   "description"
    t.string   "place"
    t.string   "picture"
    t.integer  "vacancies"
    t.integer  "house_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",          :null => false
    t.string   "encrypted_password",     :default => "",          :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "rg"
    t.string   "cpf"
    t.string   "telefone"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "role",                   :default => "site_user"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
