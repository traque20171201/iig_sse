# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_07_191300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "departments", id: { comment: "ID" }, comment: "Departments", force: :cascade do |t|
    t.string "name", null: false, comment: "Tên phòng ban"
    t.string "description", comment: "Mô tả"
    t.datetime "created_at", null: false, comment: "Ngày giờ tạo"
    t.datetime "updated_at", null: false, comment: "Ngày giờ cập nhật"
  end

  create_table "employees", id: { comment: "ID" }, comment: "Users", force: :cascade do |t|
    t.string "employee_number", null: false, comment: "Mã số nhân viên"
    t.string "name", null: false, comment: "Họ tên"
    t.string "phone", comment: "Số điện thoại"
    t.string "email", comment: "Email"
    t.string "encrypted_password", comment: "Mật khẩu"
    t.integer "gender", comment: "Giới tính"
    t.date "birth_date", comment: "Ngày sinh"
    t.date "registration_date", comment: "Ngày vào công ty"
    t.string "position", null: false, comment: "Chức danh"
    t.string "branch", null: false, comment: "Chi nhánh"
    t.integer "role", default: 0, null: false, comment: "Vị trí"
    t.bigint "department_id", null: false, comment: "ID phòng ban"
    t.datetime "created_at", null: false, comment: "Ngày giờ tạo"
    t.datetime "updated_at", null: false, comment: "Ngày giờ cập nhật"
  end

  create_table "evaluation_details", id: { comment: "ID" }, comment: "Evaluation Details", force: :cascade do |t|
    t.bigint "evaluation_id", null: false, comment: "ID Bảng đánh giá"
    t.bigint "evaluation_point_id", null: false, comment: "ID Tiêu chí đánh giá"
    t.integer "employee_point", comment: "Điểm nhân viên tự đánh giá"
    t.string "employee_comment", comment: "Nhân viên diễn giải cụ thể"
    t.integer "manager_point", comment: "Điểm quản lý trực tiếp đánh giá"
    t.string "manager_comment", comment: "Quản lý trực tiếp diễn giải cụ thể"
    t.integer "appraiser_point", comment: "Điểm quản lý thẩm định đánh giá"
    t.datetime "created_at", null: false, comment: "Ngày giờ tạo"
    t.datetime "updated_at", null: false, comment: "Ngày giờ cập nhật"
    t.string "appraiser_comment", comment: "Thẩm định diễn giải cụ thể"
  end

  create_table "evaluations", id: { comment: "ID" }, comment: "Evaluations", force: :cascade do |t|
    t.bigint "employee_id", null: false, comment: "ID Nhân viên"
    t.bigint "manager_id", null: false, comment: "ID Quản lý trực tiếp"
    t.bigint "appraiser_id", comment: "ID Quản lý thẩm định"
    t.integer "status", default: 0, null: false, comment: "Trạng thái đánh giá"
    t.integer "year", null: false
    t.string "achievements", comment: "Định hướng phát triển trong thời gian tới (Là mục tiêu phát triển cần hoàn thành hay phấn đấu trong thời gian tới )"
    t.string "positive_goals", comment: "Điểm tích cực cần phát huy"
    t.string "negative_goals", comment: "Điểm hạn chế cần sửa đổi"
    t.string "overall_comments", comment: "Sáng kiến / Đề xuất / Kiến nghị / Đóng góp ý kiến"
    t.date "one_one_date", comment: "Ngày thực hiện trao đổi 1:1 giữa người được đánh giá và CBQL trực tiếp đánh giá"
    t.string "employee_comments", comment: "Ý kiến của người được đánh giá về kết quả đánh giá của CBQL trực tiếp đánh giá (sau trao đổi 1:1 - ghi nhận ý kiến thực)"
    t.boolean "is_agree", comment: "Đồng ý / Không đồng ý với kết quả đánh giá của người được đánh giá"
    t.float "employee_point", comment: "Điểm của CBNV tự đánh giá"
    t.float "manager_point", comment: "Điểm của CBQL trực tiếp đánh giá"
    t.float "appraiser_point", comment: "Điểm của CBNV thẩm định 2"
    t.string "description", comment: "Mô tả"
    t.datetime "created_at", null: false, comment: "Ngày giờ tạo"
    t.datetime "updated_at", null: false, comment: "Ngày giờ cập nhật"
    t.integer "result", comment: "Kế hoạch phát triển nhân sự"
  end

  create_table "master_evaluation_points", id: { comment: "ID" }, comment: "Evaluations", force: :cascade do |t|
    t.string "name", null: false, comment: "Tiêu chí đánh giá"
    t.integer "order", null: false, comment: "Số thứ tự"
    t.float "factor", null: false, comment: "Trọng số"
    t.boolean "is_manager", default: false, null: false, comment: "Thuộc tiêu chí quản lý"
    t.datetime "created_at", null: false, comment: "Ngày giờ tạo"
    t.datetime "updated_at", null: false, comment: "Ngày giờ cập nhật"
    t.string "guide", comment: "Hướng dẫn đánh giá cho tiêu chí"
  end

end
