CREATE TABLE master_evaluation_points (
  id bigserial PRIMARY KEY,

  "name" varchar NOT NULL,

  "order" int4 NOT NULL,

  factor float NOT NULL,

  is_manager bool DEFAULT false NOT NULL, 

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE master_evaluation_points IS 'Evaluations';

-- Column comments

COMMENT ON COLUMN master_evaluation_points.id IS 'ID';

COMMENT ON COLUMN master_evaluation_points.name IS 'Tiêu chí đánh giá';

COMMENT ON COLUMN master_evaluation_points.order IS 'Số thứ tự';

COMMENT ON COLUMN master_evaluation_points.factor IS 'Trọng số';

COMMENT ON COLUMN master_evaluation_points.is_manager IS 'Thuộc tiêu chí quản lý';

COMMENT ON COLUMN master_evaluation_points.created_at IS 'Ngày giờ tạo';

COMMENT ON COLUMN master_evaluation_points.updated_at IS 'Ngày giờ cập nhật';
