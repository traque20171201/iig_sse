ALTER TABLE evaluations
  ADD COLUMN result int4 NULL; -- 1: Quy hoạch cán bộ nguồn, 2: Giữ nguyên vị trí hiện tại, 3: Đào tạo để phù hợp với vị trí hiện tại, 4: Thay đổi vị trí công việc, 5: Không ký hợp đồng

COMMENT ON COLUMN evaluations.result IS 'Kế hoạch phát triển nhân sự';
