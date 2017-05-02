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

ActiveRecord::Schema.define(version: 20170502194208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cache_container", primary_key: "cid", id: :string, limit: 255, default: "", comment: "Primary Key: Unique cache ID.", force: :cascade, comment: "Storage for the cache API." do |t|
    t.binary  "data",                                                                         comment: "A collection of data to cache."
    t.integer "expire",                                          default: 0,     null: false, comment: "A Unix timestamp indicating when the cache entry should expire, or -1 for never."
    t.decimal "created",                precision: 14, scale: 3, default: "0.0", null: false, comment: "A timestamp with millisecond precision indicating when the cache entry was created."
    t.integer "serialized", limit: 2,                            default: 0,     null: false, comment: "A flag to indicate whether content is serialized (1) or not (0)."
    t.text    "tags",                                                                         comment: "Space-separated list of cache tags for this entry."
    t.string  "checksum",   limit: 255,                                          null: false, comment: "The tag invalidation checksum when this entry was saved."
    t.index ["expire"], name: "cache_container__expire__idx", using: :btree
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type", using: :btree
  end

  create_table "colors", force: :cascade do |t|
    t.string   "title"
    t.string   "material"
    t.string   "hex1"
    t.string   "hex2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pressitems", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
    t.string   "link"
    t.string   "sitename"
    t.text     "body"
    t.string   "image"
    t.string   "slug"
    t.index ["slug"], name: "index_pressitems_on_slug", unique: true, using: :btree
  end

  create_table "productimages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "product_id"
    t.integer  "color_id"
    t.string   "front"
    t.string   "side1"
    t.string   "top"
    t.string   "with_model"
    t.index ["color_id"], name: "index_productimages_on_color_id", using: :btree
    t.index ["product_id"], name: "index_productimages_on_product_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "title"
    t.decimal  "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.index ["slug"], name: "index_products_on_slug", unique: true, using: :btree
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.string   "tagline"
    t.string   "image"
    t.string   "caption"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_stories_on_slug", unique: true, using: :btree
  end

  create_table "stories_tags", id: false, force: :cascade do |t|
    t.integer "story_id", null: false
    t.integer "tag_id",   null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  add_foreign_key "productimages", "colors"
  add_foreign_key "productimages", "products"
end
