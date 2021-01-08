# frozen_string_literal: true

class ManagerEvaluationService
    attr_reader :result
    
    def initialize(request_params)
      @request_params = request_params
    end
  
    def run!
      evaluation = Evaluation.find(@request_params.id)
  
      status = 3
      if @request_params.save == 'Save' || @request_params.save == 'Hoàn thành'
        status = 4
      end
      total_manager_point = 0
      total_factor = 0
  
      @request_params.evaluation_details.each do |rec|
        evaluation_detail = EvaluationDetail.find(rec.id)
        total_manager_point = total_manager_point + (rec.factor*rec.manager_point) if rec.manager_point.present?
        total_factor = total_factor + rec.factor
  
        evaluation_detail.update!(
          manager_point: rec.manager_point,
          manager_comment: rec.manager_comment
        )
      end

      manager_point = total_manager_point/total_factor if total_factor.positive?
  
      evaluation.update!(
        status: status,
        manager_point: manager_point.round(1),
        achievements_manager: @request_params.achievements_manager,
        positive_goals_manager: @request_params.positive_goals_manager,
        negative_goals_manager: @request_params.negative_goals_manager,
        overall_comments_manager: @request_params.overall_comments_manager,
        result: @request_params.result
      )
  
      @result = 'Cập nhật dữ liệu thành công.'
    end
  end
  