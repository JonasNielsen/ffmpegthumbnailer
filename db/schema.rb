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

ActiveRecord::Schema.define(:version => 20130422045006) do

  create_table "basket_items", :force => true do |t|
    t.integer  "basket_id"
    t.integer  "product_id",                     :null => false
    t.string   "product_type",                   :null => false
    t.integer  "quantity",                       :null => false
    t.boolean  "active",       :default => true, :null => false
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  add_index "basket_items", ["basket_id", "product_type", "active"], :name => "index_basket_items_on_basket_id_and_product_type_and_active"

  create_table "baskets", :force => true do |t|
    t.integer  "user_id"
    t.string   "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "box_menuorders", :force => true do |t|
    t.integer "menuorder_id",                :null => false
    t.integer "box_id",                      :null => false
    t.integer "portions",     :default => 0, :null => false
  end

  create_table "boxes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.decimal  "price",       :precision => 8, :scale => 2, :null => false
    t.integer  "image_id"
    t.text     "description"
    t.string   "slug"
  end

  create_table "boxes_deliveryschedules", :id => false, :force => true do |t|
    t.integer "deliveryschedule_id", :null => false
    t.integer "box_id",              :null => false
  end

  create_table "boxes_recipes", :id => false, :force => true do |t|
    t.integer "recipe_id", :null => false
    t.integer "box_id",    :null => false
  end

  create_table "brand_optins", :id => false, :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "chef_id",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "brand_optins", ["user_id", "chef_id"], :name => "index_brand_optins_on_user_id_and_chef_id", :unique => true

  create_table "credits", :force => true do |t|
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "purchased"
    t.integer  "remaining"
    t.date     "expiration_date"
    t.integer  "user_id"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["failed_at"], :name => "delayed_jobs_failed_at"
  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "deliveryschedule_images", :force => true do |t|
    t.integer  "deliveryschedule_id", :null => false
    t.integer  "image_id",            :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "deliveryschedules", :force => true do |t|
    t.date     "delivery_date"
    t.date     "billing_date"
    t.boolean  "open"
    t.integer  "scheduletype",   :default => 1, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "shipping_label"
  end

  create_table "deliveryzips", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "zipcode"
  end

  create_table "discountcodes", :force => true do |t|
    t.string   "code"
    t.integer  "minimum_spend"
    t.float    "discount_amount"
    t.string   "percent_or_dollar"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "giftcards", :force => true do |t|
    t.string   "code"
    t.boolean  "redeemed"
    t.string   "product"
    t.string   "recipient_email"
    t.text     "gift_message"
    t.string   "recipient_first_name"
    t.string   "recipient_last_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.integer  "purchased_by"
  end

  create_table "images", :force => true do |t|
    t.text     "description"
    t.string   "file"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "use"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "name"
    t.string   "measurement_unit"
    t.integer  "cost"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "labelsize"
    t.string   "display_name"
  end

  create_table "inventories", :force => true do |t|
    t.integer  "quantity_warning_level", :default => 0, :null => false
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.integer  "quantity_total",         :default => 0, :null => false
  end

  create_table "invites", :force => true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.boolean  "clicked"
    t.boolean  "converted"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menuorder_recipes", :force => true do |t|
    t.integer  "menuorder_id", :null => false
    t.integer  "recipe_id",    :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "portions"
  end

  add_index "menuorder_recipes", ["recipe_id"], :name => "index_menuorder_recipes_on_recipe_id"

  create_table "menuorders", :force => true do |t|
    t.integer  "user_id",                                :null => false
    t.integer  "deliveryschedule_id",                    :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "billed",              :default => false
    t.boolean  "wholesale_ordered",   :default => false
    t.boolean  "delivered",           :default => false
    t.string   "batch"
  end

  add_index "menuorders", ["deliveryschedule_id"], :name => "index_menuorders_on_deliveryschedule_id"

  create_table "newsletter_emails", :force => true do |t|
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "zip_code"
    t.integer  "user_id"
    t.boolean  "unsubscribed"
    t.string   "my_referral_code"
    t.integer  "promo_plates_on_reg", :default => 0
    t.string   "email_hash"
  end

  add_index "newsletter_emails", ["my_referral_code"], :name => "index_newsletter_emails_on_my_referral_code", :unique => true

  create_table "plateactions", :force => true do |t|
    t.integer  "transacted_by"
    t.integer  "subscription_id"
    t.integer  "plates_added"
    t.integer  "plates_redeemed"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "charge"
    t.integer  "ordered"
    t.string   "code_used"
    t.integer  "boxes_added"
  end

  create_table "promocodes", :force => true do |t|
    t.string   "code"
    t.boolean  "redeemed"
    t.integer  "user_id"
    t.string   "product"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "promo"
    t.string   "delivery_date"
  end

  create_table "recipe_details", :force => true do |t|
    t.integer  "recipe_id",     :null => false
    t.integer  "ingredient_id", :null => false
    t.float    "quantity"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "recipe_images", :force => true do |t|
    t.integer  "recipe_id",  :null => false
    t.integer  "image_id",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipe_schedules", :force => true do |t|
    t.integer  "recipe_id",           :null => false
    t.integer  "deliveryschedule_id", :null => false
    t.integer  "default_order"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "inventory_id",        :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.text     "tip"
    t.text     "story"
    t.string   "fake_ingredient_count"
    t.string   "fake_substitutions"
    t.string   "short_name"
    t.string   "slug"
  end

  create_table "service_issue_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.boolean  "active",     :default => true
  end

  create_table "shipping_labels", :force => true do |t|
    t.integer  "menuorder_id",                           :null => false
    t.string   "status",          :default => "pending", :null => false
    t.string   "tracking_number"
    t.string   "output"
    t.text     "status_message"
    t.integer  "duration"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  create_table "subscriptions", :force => true do |t|
    t.boolean  "active"
    t.integer  "chargify_subscription_id"
    t.integer  "chargify_customer_id"
    t.text     "delivery_instructions"
    t.integer  "number_of_weekly_meals"
    t.integer  "portions"
    t.string   "shipping_address"
    t.string   "shipping_city"
    t.string   "shipping_state"
    t.string   "shipping_zip"
    t.integer  "user_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "delete_me_my_referral_code"
    t.string   "shipping_first_name"
    t.string   "shipping_last_name"
    t.integer  "phone_number",               :limit => 8
    t.string   "dp_subscription_id"
    t.string   "delete_who_referred_me"
    t.integer  "who_referred_me"
  end

  create_table "user_service_logs", :force => true do |t|
    t.integer  "user_id"
    t.integer  "deliveryschedule_id"
    t.integer  "menuorder_id"
    t.integer  "service_issue_type_id"
    t.text     "notes"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.integer  "credit_id"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username"
    t.boolean  "admin"
    t.boolean  "featured"
    t.text     "bio"
    t.string   "blog_url"
    t.string   "location"
    t.string   "twitter_handle"
    t.string   "facebook_name"
    t.string   "pinterest_name"
    t.string   "avatar"
    t.string   "mixpanel_identifier"
    t.string   "logo_byline"
    t.string   "brand_language"
    t.string   "video_media"
    t.string   "logo"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "vendor_ingredients", :force => true do |t|
    t.integer  "vendor_id",     :null => false
    t.integer  "ingredient_id", :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "videos", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
