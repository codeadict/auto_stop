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

ActiveRecord::Schema.define(version: 20150919035025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adjuntos", force: :cascade do |t|
    t.integer  "estado_vehiculo_id"
    t.string   "archivo_file_name"
    t.string   "archivo_content_type"
    t.integer  "archivo_file_size"
    t.datetime "archivo_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "clientes", force: :cascade do |t|
    t.string   "tipo_identificacion", default: "0", null: false
    t.string   "identificacion",                    null: false
    t.string   "empresa"
    t.string   "nombre_y_apellidos",                null: false
    t.string   "telefono"
    t.string   "celular"
    t.string   "correo"
    t.string   "direccion"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "tipo"
  end

  add_index "clientes", ["identificacion"], name: "index_clientes_on_identificacion", using: :btree
  add_index "clientes", ["tipo_identificacion"], name: "index_clientes_on_tipo_identificacion", using: :btree

  create_table "ejecutivos", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.string   "correo",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ejecutivos", ["correo"], name: "index_ejecutivos_on_correo", using: :btree

  create_table "estado_vehiculos", force: :cascade do |t|
    t.integer  "vehiculo_id"
    t.integer  "estado_id"
    t.text     "notas",                                        null: false
    t.datetime "fecha_y_hora", default: '2015-08-23 00:00:00', null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "estado_vehiculos", ["vehiculo_id"], name: "index_estado_vehiculos_on_vehiculo_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nombre",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "estados", ["nombre"], name: "index_estados_on_nombre", using: :btree

  create_table "pages", force: :cascade do |t|
    t.integer  "layout"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehiculos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.string   "placa",                   null: false
    t.string   "marca",                   null: false
    t.string   "modelo",                  null: false
    t.string   "anio",                    null: false
    t.string   "color"
    t.string   "responsabilidad_civil"
    t.string   "aseguradora"
    t.string   "poliza"
    t.float    "kilometraje_actual"
    t.text     "descripcion_del_trabajo"
    t.date     "fecha_ingreso"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "ejecutivo_id"
  end

  add_index "vehiculos", ["cliente_id"], name: "index_vehiculos_on_cliente_id", using: :btree
  add_index "vehiculos", ["ejecutivo_id"], name: "index_vehiculos_on_ejecutivo_id", using: :btree
  add_index "vehiculos", ["marca"], name: "index_vehiculos_on_marca", using: :btree
  add_index "vehiculos", ["modelo"], name: "index_vehiculos_on_modelo", using: :btree
  add_index "vehiculos", ["placa"], name: "index_vehiculos_on_placa", using: :btree

  add_foreign_key "estado_vehiculos", "estados"
  add_foreign_key "estado_vehiculos", "vehiculos"
  add_foreign_key "vehiculos", "clientes"
end
