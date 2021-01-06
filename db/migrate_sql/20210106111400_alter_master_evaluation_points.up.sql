ALTER TABLE master_evaluation_points
  ADD COLUMN guide varchar NULL;

COMMENT ON COLUMN master_evaluation_points.guide IS 'Hướng dẫn đánh giá cho tiêu chí';
