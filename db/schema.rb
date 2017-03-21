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

ActiveRecord::Schema.define(version: 20170224070600) do

  create_table "activities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "action_type"
    t.integer  "activity_type"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_activities_on_user_id", using: :btree
  end

  create_table "attach_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "publish_date"
    t.integer  "number_page"
    t.datetime "limit_date"
    t.text     "description",  limit: 65535
    t.integer  "book_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["book_id", "created_at"], name: "index_attach_books_on_book_id_and_created_at", using: :btree
    t.index ["book_id"], name: "index_attach_books_on_book_id", using: :btree
  end

  create_table "authors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "title"
    t.text     "description",  limit: 65535
    t.boolean  "status"
    t.string   "image"
    t.integer  "category_id"
    t.integer  "publisher_id"
    t.integer  "author_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["author_id", "created_at"], name: "index_books_on_author_id_and_created_at", using: :btree
    t.index ["author_id"], name: "index_books_on_author_id", using: :btree
    t.index ["category_id", "created_at"], name: "index_books_on_category_id_and_created_at", using: :btree
    t.index ["category_id"], name: "index_books_on_category_id", using: :btree
    t.index ["publisher_id", "created_at"], name: "index_books_on_publisher_id_and_created_at", using: :btree
    t.index ["publisher_id"], name: "index_books_on_publisher_id", using: :btree
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["book_id"], name: "index_comments_on_book_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "likes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_likes_on_book_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "relationships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "requests", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "start_day"
    t.datetime "end_day"
    t.text     "content",    limit: 65535
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["book_id"], name: "index_requests_on_book_id", using: :btree
    t.index ["user_id"], name: "index_requests_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float    "rating",     limit: 24
    t.text     "content",    limit: 65535
    t.integer  "user_id"
    t.integer  "book_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["book_id"], name: "index_reviews_on_book_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "password_digest"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "avatar"
    t.boolean  "is_admin",        default: false
    t.boolean  "remember_digest"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["email", "phone"], name: "index_users_on_email_and_phone", unique: true, using: :btree
  end

end
