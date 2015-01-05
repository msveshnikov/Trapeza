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

ActiveRecord::Schema.define(version: 20150105165900) do

  create_table "categories", force: true do |t|
    t.text    "Title"
    t.integer "Rank"
    t.integer "ParentCategory_ID"
    t.integer "Language_ID"
    t.string  "keywords"
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "recipe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture"
  end

  add_index "comments", ["recipe_id", "created_at"], name: "index_comments_on_recipe_id_and_created_at"

  create_table "ingredients", force: true do |t|
    t.text    "Title"
    t.integer "Gramm"
    t.decimal "Proteins"
    t.decimal "Fats"
    t.decimal "Carbohydrates"
    t.decimal "Kcal"
    t.decimal "Water"
    t.integer "Parent_ID"
    t.integer "VisibleInSerach"
  end

  create_table "recipes", force: true do |t|
    t.decimal "Date"
    t.text    "Title"
    t.text    "TitleSearch"
    t.binary  "Description"
    t.text    "Media"
    t.text    "MediaVK"
    t.integer "Group_ID"
    t.integer "category_id"
    t.decimal "PublishDate"
    t.integer "isStepPhoto"
    t.integer "subcategory_id"
    t.text    "Ingredients"
    t.text    "ServingsNumber"
    t.text    "RecipeAuthor"
    t.integer "TimePrepare"
    t.integer "TimeCooking"
    t.decimal "Rating"
    t.integer "VotesCount"
    t.integer "CommentsCount"
    t.integer "IsNew"
  end

  create_table "sqlite_sp_functions", id: false, force: true do |t|
    t.text "name"
    t.text "text"
  end

  create_table "sqlite_vs_links_names", id: false, force: true do |t|
    t.text "name"
    t.text "alias"
  end

  create_table "sqlite_vs_properties", id: false, force: true do |t|
    t.text "parentType"
    t.text "parentName"
    t.text "propertyName"
    t.text "propertyValue"
  end

  create_table "types", force: true do |t|
    t.text "title"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "image"
  end

  create_table "visits", force: true do |t|
    t.integer  "recipe_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
