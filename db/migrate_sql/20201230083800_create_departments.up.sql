CREATE TABLE departments (
  id bigserial PRIMARY KEY,

  name varchar NOT NULL,

  description varchar NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE departments IS 'Departments';

-- Column comments

COMMENT ON COLUMN departments.id IS 'ID';

COMMENT ON COLUMN departments.name IS 'Tên phòng ban';

COMMENT ON COLUMN departments.description IS 'Mô tả';

COMMENT ON COLUMN departments.created_at IS 'Ngày giờ tạo';

COMMENT ON COLUMN departments.updated_at IS 'Ngày giờ cập nhật';
