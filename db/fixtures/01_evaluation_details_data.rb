# frozen_string_literal: true

ActiveRecord::Base.transaction do
  evaluations = Evaluation.all
  master_evaluation_points = MasterEvaluationPoint.all
  evaluation_details = []

  evaluations.each do |evaluation|
    master_evaluation_points.each do |evaluation_point|
      evaluation_detail = EvaluationDetail.find_or_initialize_by(id: 0)

    #   evaluation_detail.id = evaluation.id
      evaluation_detail.evaluation_id = evaluation.id
      evaluation_detail.evaluation_point_id = evaluation_point.id
      evaluation_detail.created_at = Time.now
      evaluation_detail.updated_at = Time.now

      evaluation_details << evaluation_detail
    end
  end

  EvaluationDetail.insert_all(evaluation_details) if evaluation_details.present?
end
