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

ActiveRecord::Schema.define(version: 20140717001327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievment_comments", id: false, force: true do |t|
    t.integer  "id",            default: "nextval('achievment_comments_id_seq'::regclass)", null: false
    t.text     "comment"
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "tenant_id"
    t.integer  "achievment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievment_datas", id: false, force: true do |t|
    t.integer  "id",            default: "nextval('achievment_datas_id_seq'::regclass)", null: false
    t.string   "key"
    t.string   "value"
    t.integer  "tenant_id"
    t.integer  "achievment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievment_levels", id: false, force: true do |t|
    t.integer  "id",                 default: "nextval('achievment_levels_id_seq'::regclass)", null: false
    t.string   "name"
    t.integer  "order"
    t.string   "tags"
    t.integer  "tenant_id"
    t.integer  "achievment_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievment_types", id: false, force: true do |t|
    t.integer  "id",         default: "nextval('achievment_types_id_seq'::regclass)", null: false
    t.string   "name"
    t.string   "tags"
    t.integer  "weight"
    t.boolean  "internal"
    t.integer  "category"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "achievments", id: false, force: true do |t|
    t.integer  "id",                  default: "nextval('achievments_id_seq'::regclass)", null: false
    t.string   "name"
    t.string   "institution"
    t.boolean  "approved",            default: false
    t.boolean  "read",                default: false
    t.boolean  "private",             default: true
    t.boolean  "internal",            default: false
    t.boolean  "request",             default: false
    t.string   "tags"
    t.text     "comments"
    t.text     "description"
    t.datetime "date_finished"
    t.datetime "date_start"
    t.integer  "load"
    t.integer  "user_id"
    t.integer  "achievment_type_id"
    t.integer  "achievment_level_id"
    t.integer  "virtue_id"
    t.integer  "tenant_id"
    t.integer  "origin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign9boxes", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('campaign9boxes_id_seq'::regclass)", null: false
    t.integer  "user_id"
    t.integer  "x_axis"
    t.integer  "y_axis"
    t.integer  "factor_x"
    t.integer  "factor_y"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_id"
    t.integer  "tenant_id"
  end

  create_table "campaign_group_accesses", id: false, force: true do |t|
    t.integer  "id",                default: "nextval('campaign_group_accesses_id_seq'::regclass)", null: false
    t.string   "kind"
    t.integer  "campaign_group_id"
    t.integer  "user_id"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_groups", id: false, force: true do |t|
    t.integer  "id",           default: "nextval('campaign_groups_id_seq'::regclass)", null: false
    t.integer  "campaign_id"
    t.integer  "group_id"
    t.integer  "user_id"
    t.string   "status"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "manager_id"
    t.boolean  "permission"
    t.integer  "validator_id"
    t.string   "comment"
  end

  create_table "campaign_question_groups", id: false, force: true do |t|
    t.integer  "id",                                         default: "nextval('campaign_question_groups_id_seq'::regclass)", null: false
    t.integer  "campaign_id"
    t.integer  "question_group_id"
    t.integer  "tenant_id"
    t.decimal  "total",             precision: 15, scale: 7
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "total_goal",        precision: 15, scale: 7
    t.integer  "order",                                      default: 1,                                                      null: false
    t.boolean  "show_header",                                default: true
    t.boolean  "subtitle",                                   default: true
  end

  create_table "campaign_questions", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('campaign_questions_id_seq'::regclass)", null: false
    t.integer  "campaign_id"
    t.integer  "question_id"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_user_accesses", id: false, force: true do |t|
    t.integer  "id",               default: "nextval('campaign_user_accesses_id_seq'::regclass)", null: false
    t.string   "kind"
    t.integer  "campaign_user_id"
    t.integer  "user_id"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaign_users", id: false, force: true do |t|
    t.integer  "id",                      default: "nextval('campaign_users_id_seq'::regclass)", null: false
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_to_be_evaluated_id"
    t.integer  "tenant_id"
    t.string   "status",                  default: "open"
    t.string   "kind"
    t.boolean  "hidden",                  default: false
    t.boolean  "button_permission"
    t.boolean  "user_finisher"
    t.boolean  "evaluated_finisher"
  end

  create_table "campaigns", id: false, force: true do |t|
    t.integer  "id",                                default: "nextval('campaigns_id_seq'::regclass)", null: false
    t.string   "campaign_name"
    t.string   "description"
    t.date     "initial_date"
    t.date     "final_date"
    t.integer  "user_id"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "kind"
    t.integer  "external"
    t.integer  "scale_id"
    t.string   "division"
    t.integer  "orgchart_id"
    t.boolean  "has_pdi",                           default: false
    t.boolean  "on"
    t.integer  "question_group_id"
    t.string   "annual_title"
    t.integer  "number_min"
    t.integer  "minimo"
    t.integer  "maximo"
    t.boolean  "morefields"
    t.boolean  "show_id_from_questions"
    t.string   "input_title"
    t.text     "result_scale"
    t.boolean  "has_smart"
    t.integer  "phase"
    t.string   "free_kind_name"
    t.boolean  "sum_calculation_type"
    t.boolean  "simple_average_calculation_type"
    t.boolean  "weighted_average_calculation_type"
  end

  create_table "goals", id: false, force: true do |t|
    t.integer  "id",                                        default: "nextval('goals_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.decimal  "value",            precision: 15, scale: 4
    t.string   "unit"
    t.string   "calculation_kind"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "inverted",                                  default: false
  end

  create_table "group_questionnaires", id: false, force: true do |t|
    t.integer  "id",                                          default: "nextval('group_questionnaires_id_seq'::regclass)", null: false
    t.decimal  "value",              precision: 30, scale: 5
    t.string   "value_str"
    t.decimal  "original_value",     precision: 30, scale: 5
    t.string   "original_value_str"
    t.string   "description"
    t.integer  "tenant_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "group_id"
    t.integer  "revisor_user_id"
    t.string   "reason"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('groups_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "group_uuid"
    t.string   "kind"
  end

  create_table "image_assets", id: false, force: true do |t|
    t.integer  "id",                 default: "nextval('image_assets_id_seq'::regclass)", null: false
    t.integer  "tenant_id"
    t.integer  "height"
    t.integer  "width"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orgcharts", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('orgcharts_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "default",     default: false
  end

  create_table "positions", id: false, force: true do |t|
    t.integer  "id",                                        default: "nextval('positions_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.string   "tags"
    t.integer  "learn"
    t.integer  "develop"
    t.integer  "level"
    t.decimal  "max_wage",          precision: 8, scale: 2
    t.decimal  "min_wage",          precision: 8, scale: 2
    t.integer  "tenant_id"
    t.integer  "area_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "wage",              precision: 8, scale: 2
    t.integer  "position_group_id"
  end

  create_table "quedas", force: true do |t|
    t.string   "imei"
    t.text     "amostra"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tipo_queda"
    t.string   "locationX"
    t.string   "locationY"
    t.string   "tempo_queda"
    t.string   "tempo_recebimento"
    t.string   "email"
    t.string   "feedback"
  end

  create_table "question_group_validations", id: false, force: true do |t|
    t.integer  "id",                                         default: "nextval('question_group_validations_id_seq'::regclass)", null: false
    t.integer  "question_group_id",                                                                                             null: false
    t.integer  "campaign_user_id"
    t.integer  "campaign_group_id"
    t.integer  "tenant_id"
    t.string   "name"
    t.string   "description"
    t.decimal  "value",             precision: 10, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_groups", id: false, force: true do |t|
    t.integer  "id",                                default: "nextval('question_groups_id_seq'::regclass)", null: false
    t.string   "name"
    t.string   "description"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "enable"
    t.boolean  "has_custom_rating_scale"
    t.integer  "scale_id"
    t.boolean  "on"
    t.integer  "goal_id"
    t.boolean  "show_result"
    t.string   "weight_value"
    t.boolean  "kind"
    t.boolean  "discricionaria"
    t.integer  "min"
    t.integer  "max"
    t.integer  "user_id"
    t.float    "max_height"
    t.boolean  "sum_calculation_type"
    t.boolean  "simple_average_calculation_type"
    t.boolean  "weighted_average_calculation_type"
    t.boolean  "weight_calculation_type"
  end

  create_table "question_weights", id: false, force: true do |t|
    t.integer  "id",                default: "nextval('question_weights_id_seq'::regclass)", null: false
    t.integer  "question_id",                                                                null: false
    t.integer  "campaign_user_id"
    t.integer  "campaign_group_id"
    t.integer  "tenant_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", id: false, force: true do |t|
    t.integer  "id",                             default: "nextval('questions_id_seq'::regclass)", null: false
    t.string   "name",              limit: 2000
    t.string   "kind",                           default: "N"
    t.text     "keys"
    t.text     "values"
    t.boolean  "required",                       default: true
    t.integer  "min_value",                      default: 1
    t.integer  "max_value",                      default: 5
    t.boolean  "applies",                        default: false
    t.integer  "order"
    t.integer  "question_group_id"
    t.integer  "tenant_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description",       limit: 2000
    t.integer  "user_id"
    t.string   "strategies"
    t.string   "goals"
    t.string   "indicator"
    t.string   "cluster"
  end

  create_table "rule_data", id: false, force: true do |t|
    t.integer  "id",                              default: "nextval('rule_data_id_seq'::regclass)", null: false
    t.integer  "row_id"
    t.integer  "rule_datum_column_definition_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tenant_id"
    t.integer  "rule_id"
  end

  create_table "rule_datum_column_definitions", id: false, force: true do |t|
    t.integer  "id",                       default: "nextval('rule_datum_column_definitions_id_seq'::regclass)", null: false
    t.integer  "rule_datum_definition_id",                                                                       null: false
    t.string   "name"
    t.boolean  "user_column"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tenant_id"
    t.string   "kind"
  end

  create_table "rule_datum_definitions", id: false, force: true do |t|
    t.integer  "id",                default: "nextval('rule_datum_definitions_id_seq'::regclass)", null: false
    t.string   "table_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "data_file_name"
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.datetime "data_updated_at"
    t.integer  "tenant_id"
    t.string   "model_name"
    t.string   "model_id"
    t.boolean  "trigger",           default: false
  end

  create_table "rule_logs", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('rule_logs_id_seq'::regclass)", null: false
    t.string   "msg"
    t.string   "kind"
    t.text     "stack_trace"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", id: false, force: true do |t|
    t.integer  "id",            default: "nextval('rules_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "preconditions"
    t.text     "rule_body"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scale_values", id: false, force: true do |t|
    t.integer  "id",                                           default: "nextval('scale_values_id_seq'::regclass)", null: false
    t.text     "description"
    t.integer  "tenant_id"
    t.integer  "scale_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "distribution_target"
    t.decimal  "value",               precision: 10, scale: 3
    t.string   "value_str"
    t.integer  "scale_valuable_id"
    t.string   "scale_valuable_type"
  end

  create_table "scales", id: false, force: true do |t|
    t.integer  "id",                                default: "nextval('scales_id_seq'::regclass)", null: false
    t.string   "kind"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.text     "description"
    t.boolean  "show_distribution"
    t.string   "unit"
    t.integer  "value_max"
    t.boolean  "sum_calculation_type"
    t.boolean  "simple_average_calculation_type"
    t.boolean  "weighted_average_calculation_type"
    t.boolean  "weight_calculation_type"
  end

  create_table "scores", id: false, force: true do |t|
    t.integer  "id",                                         default: "nextval('scores_id_seq'::regclass)", null: false
    t.integer  "required_score_id"
    t.decimal  "obtained_score_id", precision: 50, scale: 2
    t.text     "description"
    t.string   "status"
    t.integer  "skill_id"
    t.integer  "tenant_id"
    t.integer  "campaign_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reason"
    t.decimal  "original_score_id", precision: 50, scale: 2
    t.integer  "revisor_user_id"
  end

  create_table "skill_actions", id: false, force: true do |t|
    t.integer  "id",            default: "nextval('skill_actions_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.integer  "tenant_id"
    t.integer  "skill_goal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deadline"
    t.text     "resources"
    t.boolean  "finished",      default: false
  end

  create_table "skill_comments", id: false, force: true do |t|
    t.integer  "id",                          default: "nextval('skill_comments_id_seq'::regclass)", null: false
    t.text     "user_to_be_evaluated_coment"
    t.text     "user_evaluator_coment"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campaign_user_id"
    t.integer  "skill_id"
    t.integer  "tenant_id"
  end

  create_table "skill_goals", id: false, force: true do |t|
    t.integer  "id",           default: "nextval('skill_goals_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.integer  "tenant_id"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "campaign_id"
    t.float    "due_progress", default: 0.0
  end

  create_table "skill_kinds", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('skill_kinds_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.integer  "tenant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "skill_positions", id: false, force: true do |t|
    t.integer "id",          default: "nextval('skill_positions_id_seq'::regclass)", null: false
    t.integer "skill_id"
    t.integer "position_id"
    t.integer "tenant_id"
  end

  create_table "skills", id: false, force: true do |t|
    t.integer  "id",            default: "nextval('skills_id_seq'::regclass)", null: false
    t.string   "name"
    t.text     "description"
    t.integer  "tenant_id"
    t.integer  "skill_kind_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
  end

  create_table "statuses", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "umanni_hr_imports", id: false, force: true do |t|
    t.integer  "id",          default: "nextval('umanni_hr_imports_id_seq'::regclass)", null: false
    t.string   "name"
    t.string   "type"
    t.string   "status"
    t.integer  "tenant_id"
    t.datetime "created_at",                                                            null: false
    t.datetime "updated_at",                                                            null: false
    t.string   "spreadsheet"
  end

  create_table "user_data", id: false, force: true do |t|
    t.integer "id",                                    default: "nextval('user_data_id_seq'::regclass)", null: false
    t.integer "tenant_id",                                                                               null: false
    t.integer "user_id",                                                                                 null: false
    t.string  "kind",                                                                                    null: false
    t.string  "value"
    t.decimal "value_number", precision: 15, scale: 7
  end

  create_table "user_groups", id: false, force: true do |t|
    t.integer  "id",         default: "nextval('user_groups_id_seq'::regclass)", null: false
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "user_questionnaires", id: false, force: true do |t|
    t.integer  "id",                                          default: "nextval('user_questionnaires_id_seq'::regclass)", null: false
    t.string   "description"
    t.integer  "tenant_id"
    t.integer  "question_id"
    t.integer  "user_id"
    t.integer  "related_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "revisor_user_id"
    t.string   "reason"
    t.text     "value_str"
    t.decimal  "value",              precision: 15, scale: 8
    t.string   "original_value_str"
    t.decimal  "original_value",     precision: 10, scale: 0
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
