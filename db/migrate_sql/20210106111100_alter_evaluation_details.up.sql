ALTER TABLE evaluation_details
  ADD COLUMN appraiser_comment varchar NULL;

COMMENT ON COLUMN evaluation_details.appraiser_comment IS 'Thẩm định diễn giải cụ thể';
