CREATE TABLE evaluations (
  id bigserial PRIMARY KEY,

  employee_id int8 NOT NULL,

  manager_id int8 NOT NULL,

  appraiser_id int8 NULL,

  status int4 DEFAULT 0 NOT NULL, -- 0: Nhân viên chưa đánh giá, 1: Nhân viên đang đánh giá, 2: Nhân viên hoàn thành đánh giá, 3: Quản lý trực tiếp đang đánh giá, 4: Quản lý trực tiếp hoàn thành đánh giá, 5: Quản lý thẩm định đang đánh giá, 6: Hoàn thành đánh giá

  year int4 NOT NULL,

  achievements varchar NULL,

  positive_goals varchar NULL,

  negative_goals varchar NULL,

  overall_comments varchar NULL,

  one_one_date date NULL,

  employee_comments varchar NULL,

  is_agree bool NULL,

  employee_point float NULL,

  manager_point float NULL,

  appraiser_point float NULL,

  description varchar NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE evaluations IS 'Evaluations';

-- Column comments

COMMENT ON COLUMN evaluations.id IS 'ID';

COMMENT ON COLUMN evaluations.employee_id IS 'ID Nhân viên';

COMMENT ON COLUMN evaluations.manager_id IS 'ID Quản lý trực tiếp';

COMMENT ON COLUMN evaluations.appraiser_id IS 'ID Quản lý thẩm định';

COMMENT ON COLUMN evaluations.status IS 'Trạng thái đánh giá';

COMMENT ON COLUMN evaluations.achievements IS 'Định hướng phát triển trong thời gian tới (Là mục tiêu phát triển cần hoàn thành hay phấn đấu trong thời gian tới )';

COMMENT ON COLUMN evaluations.positive_goals IS 'Điểm tích cực cần phát huy';

COMMENT ON COLUMN evaluations.negative_goals IS 'Điểm hạn chế cần sửa đổi';

COMMENT ON COLUMN evaluations.overall_comments IS 'Sáng kiến / Đề xuất / Kiến nghị / Đóng góp ý kiến';

COMMENT ON COLUMN evaluations.one_one_date IS 'Ngày thực hiện trao đổi 1:1 giữa người được đánh giá và CBQL trực tiếp đánh giá';

COMMENT ON COLUMN evaluations.employee_comments IS 'Ý kiến của người được đánh giá về kết quả đánh giá của CBQL trực tiếp đánh giá (sau trao đổi 1:1 - ghi nhận ý kiến thực)';

COMMENT ON COLUMN evaluations.is_agree IS 'Đồng ý / Không đồng ý với kết quả đánh giá của người được đánh giá';

COMMENT ON COLUMN evaluations.employee_point IS 'Điểm của CBNV tự đánh giá';

COMMENT ON COLUMN evaluations.manager_point IS 'Điểm của CBQL trực tiếp đánh giá';

COMMENT ON COLUMN evaluations.appraiser_point IS 'Điểm của CBNV thẩm định 2';

COMMENT ON COLUMN evaluations.description IS 'Mô tả';

COMMENT ON COLUMN evaluations.created_at IS 'Ngày giờ tạo';

COMMENT ON COLUMN evaluations.updated_at IS 'Ngày giờ cập nhật';
