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

ActiveRecord::Schema.define(version: 0) do

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

end
