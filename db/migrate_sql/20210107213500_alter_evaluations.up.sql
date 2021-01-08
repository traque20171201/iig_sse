ALTER TABLE evaluations ADD COLUMN achievements_manager varchar NULL;
ALTER TABLE evaluations ADD COLUMN positive_goals_manager varchar NULL;
ALTER TABLE evaluations ADD COLUMN negative_goals_manager varchar NULL;
ALTER TABLE evaluations ADD COLUMN overall_comments_manager varchar NULL;

COMMENT ON COLUMN evaluations.positive_goals_manager IS 'Định hướng phát triển trong thời gian tới (Là mục tiêu phát triển cần hoàn thành hay phấn đấu trong thời gian tới ) giành cho quản lý trực tiếp';

COMMENT ON COLUMN evaluations.positive_goals_manager IS 'Điểm tích cực cần phát huy giành cho quản lý trực tiếp';

COMMENT ON COLUMN evaluations.negative_goals_manager IS 'Điểm hạn chế cần sửa đổi giành cho quản lý trực tiếp';

COMMENT ON COLUMN evaluations.overall_comments_manager IS 'Sáng kiến / Đề xuất / Kiến nghị / Đóng góp ý kiến giành cho quản lý trực tiếp';
