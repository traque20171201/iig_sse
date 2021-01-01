CREATE TABLE employees (
  id bigserial PRIMARY KEY,

  employee_number varchar NOT NULL,

  name varchar NOT NULL,

  phone varchar NULL,

  email varchar NULL,

  encrypted_password varchar NULL,

  gender int4 NULL,

  birth_date date NULL,

  registration_date date NULL,

  position varchar NOT NULL,

  branch varchar NOT NULL,

  role int4 DEFAULT 0 NOT NULL, -- 0: nhân viên, 1: trưởng phòng, 9: admin

  department_id int8 NOT NULL,

  created_at timestamp without time zone NOT NULL,

  updated_at timestamp without time zone NOT NULL 
);

COMMENT ON TABLE employees IS 'Users';

-- Column comments

COMMENT ON COLUMN employees.id IS 'ID';

COMMENT ON COLUMN employees.employee_number IS 'Mã số nhân viên';

COMMENT ON COLUMN employees.name IS 'Họ tên';

COMMENT ON COLUMN employees.phone IS 'Số điện thoại';

COMMENT ON COLUMN employees.email IS 'Email';

COMMENT ON COLUMN employees.encrypted_password IS 'Mật khẩu';

COMMENT ON COLUMN employees.gender IS 'Giới tính';

COMMENT ON COLUMN employees.birth_date IS 'Ngày sinh';

COMMENT ON COLUMN employees.registration_date IS 'Ngày vào công ty';

COMMENT ON COLUMN employees.position IS 'Chức danh';

COMMENT ON COLUMN employees.branch IS 'Chi nhánh';

COMMENT ON COLUMN employees.role IS 'Vị trí';

COMMENT ON COLUMN employees.department_id IS 'ID phòng ban';

COMMENT ON COLUMN employees.created_at IS 'Ngày giờ tạo';

COMMENT ON COLUMN employees.updated_at IS 'Ngày giờ cập nhật';
