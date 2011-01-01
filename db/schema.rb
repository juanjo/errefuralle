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

ActiveRecord::Schema.define(:version => 20110101230019) do

  create_table "countries", :force => true do |t|
    t.integer  "isonum",                  :null => false
    t.string   "iso2",       :limit => 2, :null => false
    t.string   "iso3",       :limit => 3, :null => false
    t.string   "name",                    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_offers", :force => true do |t|
    t.string   "title",                                   :null => false
    t.text     "description",                             :null => false
    t.text     "description_html"
    t.string   "company",                                 :null => false
    t.integer  "user_id"
    t.integer  "job_type_id"
    t.string   "state",            :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "country_id"
  end

  create_table "job_types", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title",        :null => false
    t.string   "url"
    t.text     "content",      :null => false
    t.text     "content_html"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["title"], :name => "index_posts_on_title"

  create_table "roles", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "snippets", :force => true do |t|
    t.string   "title",                              :null => false
    t.string   "cached_slug"
    t.text     "code",                               :null => false
    t.integer  "user_id"
    t.text     "description"
    t.integer  "lines",       :default => 0
    t.string   "state",       :default => "pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "snippets", ["cached_slug"], :name => "index_snippets_on_cached_slug", :unique => true
  add_index "snippets", ["title"], :name => "index_snippets_on_title"

  create_table "users", :force => true do |t|
    t.string   "username",                                            :null => false
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
