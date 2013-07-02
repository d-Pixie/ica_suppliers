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

ActiveRecord::Schema.define(:version => 20111205095558) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "icon"
    t.integer  "parentid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_suppliers", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "supplier_id", :null => false
  end

  add_index "categories_suppliers", ["category_id", "supplier_id"], :name => "index_categories_suppliers_on_category_id_and_supplier_id", :unique => true

  create_table "categorizations", :force => true do |t|
    t.integer  "supplier_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "postalcode"
    t.string   "city"
    t.string   "phone"
    t.string   "fax"
    t.string   "mail"
    t.string   "homepage"
    t.string   "latlong"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
