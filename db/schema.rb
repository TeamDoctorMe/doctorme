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

ActiveRecord::Schema.define(version: 2018_11_29_224413) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "consideration_medications", force: :cascade do |t|
    t.bigint "consideration_id"
    t.bigint "medication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consideration_id"], name: "index_consideration_medications_on_consideration_id"
    t.index ["medication_id"], name: "index_consideration_medications_on_medication_id"
  end

  create_table "consideration_patient_cases", force: :cascade do |t|
    t.bigint "consideration_id"
    t.bigint "patient_case_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["consideration_id"], name: "index_consideration_patient_cases_on_consideration_id"
    t.index ["patient_case_id"], name: "index_consideration_patient_cases_on_patient_case_id"
  end

  create_table "considerations", force: :cascade do |t|
    t.string "title"
    t.boolean "exit", default: false
    t.integer "age_min"
    t.integer "age_max"
    t.integer "gender", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "age_min", default: 0
    t.integer "age_max", default: 120
    t.integer "gender", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnosis_medications", force: :cascade do |t|
    t.bigint "diagnosis_id"
    t.bigint "medication_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_diagnosis_medications_on_diagnosis_id"
    t.index ["medication_id"], name: "index_diagnosis_medications_on_medication_id"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "medications", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "age_min", default: 0
    t.integer "age_max", default: 120
    t.integer "gender", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_cases", force: :cascade do |t|
    t.integer "gender", default: 0
    t.integer "age"
    t.bigint "symptom_id"
    t.bigint "diagnosis_id"
    t.json "diagnosis_attributes"
    t.json "medication_attributes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diagnosis_id"], name: "index_patient_cases_on_diagnosis_id"
    t.index ["symptom_id"], name: "index_patient_cases_on_symptom_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "age_min", default: 0
    t.integer "age_max", default: 120
    t.integer "gender", default: 0
    t.integer "position"
    t.integer "parent_id"
    t.bigint "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "exit", default: false
    t.index ["diagnosis_id"], name: "index_symptoms_on_diagnosis_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consideration_medications", "considerations"
  add_foreign_key "consideration_medications", "medications"
  add_foreign_key "consideration_patient_cases", "considerations"
  add_foreign_key "consideration_patient_cases", "patient_cases"
  add_foreign_key "diagnosis_medications", "diagnoses"
  add_foreign_key "diagnosis_medications", "medications"
  add_foreign_key "patient_cases", "diagnoses"
  add_foreign_key "patient_cases", "symptoms"
  add_foreign_key "symptoms", "diagnoses"
end
