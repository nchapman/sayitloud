# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100401071303) do

  create_table "hits", :force => true do |t|
    t.integer  "subdomain_id"
    t.integer  "site_id"
    t.string   "uuid"
    t.string   "referrer"
    t.string   "remote_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hits", ["created_at"], :name => "index_hits_on_created_at"
  add_index "hits", ["site_id"], :name => "index_hits_on_site_id"
  add_index "hits", ["subdomain_id"], :name => "index_hits_on_subdomain_id"

  create_table "messages", :force => true do |t|
    t.integer  "site_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["site_id"], :name => "index_messages_on_site_id"

  create_table "sites", :force => true do |t|
    t.string   "name"
    t.string   "domain"
    t.text     "template"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["domain"], :name => "index_sites_on_domain"

  create_table "static_files", :force => true do |t|
    t.string   "name"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subdomains", :force => true do |t|
    t.integer  "site_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subdomains", ["site_id"], :name => "index_subdomains_on_site_id"

  create_table "users", :force => true do |t|
    t.string   "first_name",                             :null => false
    t.string   "last_name",                              :null => false
    t.string   "email",                                  :null => false
    t.boolean  "admin",               :default => false, :null => false
    t.string   "crypted_password",                       :null => false
    t.string   "password_salt",                          :null => false
    t.string   "persistence_token",                      :null => false
    t.string   "single_access_token",                    :null => false
    t.string   "perishable_token",                       :null => false
    t.integer  "login_count",         :default => 0,     :null => false
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
