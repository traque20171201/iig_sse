# frozen_string_literal: true

ActiveRecord::Base.transaction do
  evaluations = Evaluation.all
  master_evaluation_points = MasterEvaluationPoint.all

  evaluations.each do |evaluation|
    master_evaluation_points.each do |evaluation_point|
      next if evaluation_point.is_manager && !evaluation.employee.role_before_type_cast.positive?
      evaluation_detail = EvaluationDetail.create(
        evaluation_id: evaluation.id,
        evaluation_point_id: evaluation_point.id
      )
    end
  end
end
