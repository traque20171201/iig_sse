CREATE TABLE evaluation_details (
  id bigserial PRIMARY KEY,

  evaluation_id int8 NOT NULL,

  evaluation_point_id int8 NOT NULL,

  employee_point int4 NULL,

  employee_comment varchar NULL,

  manager_point int4 NULL,

  manager_comment varchar NULL,

  appraiser_point int4 NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE evaluation_details IS 'Evaluation Details';

-- Column comments

COMMENT ON COLUMN evaluation_details.id IS 'ID';

COMMENT ON COLUMN evaluation_details.evaluation_id IS 'ID Bảng đánh giá';

COMMENT ON COLUMN evaluation_details.evaluation_point_id IS 'ID Tiêu chí đánh giá';

COMMENT ON COLUMN evaluation_details.employee_point IS 'Điểm nhân viên tự đánh giá';

COMMENT ON COLUMN evaluation_details.employee_comment IS 'Nhân viên diễn giải cụ thể';

COMMENT ON COLUMN evaluation_details.manager_point IS 'Điểm quản lý trực tiếp đánh giá';

COMMENT ON COLUMN evaluation_details.manager_comment IS 'Quản lý trực tiếp diễn giải cụ thể';

COMMENT ON COLUMN evaluation_details.appraiser_point IS 'Điểm quản lý thẩm định đánh giá';

COMMENT ON COLUMN evaluation_details.created_at IS 'Ngày giờ tạo';

COMMENT ON COLUMN evaluation_details.updated_at IS 'Ngày giờ cập nhật';
