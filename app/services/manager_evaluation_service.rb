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
      total_employee_point = 0
      total_manager_point = 0
      total_factor = 0
  
      @request_params.evaluation_details.each do |rec|
        evaluation_detail = EvaluationDetail.find(rec.id)
        total_employee_point = total_employee_point + (rec.factor*rec.employee_point) if rec.employee_point.present?
        total_manager_point = total_manager_point + (rec.factor*rec.manager_point) if rec.manager_point.present?
        total_factor = total_factor + rec.factor
  
        evaluation_detail.update!(
          employee_point: rec.employee_point,
          employee_comment: rec.employee_comment,
          manager_point: rec.manager_point,
          manager_comment: rec.manager_comment
        )
      end
  
      employee_point = total_employee_point/total_factor if total_factor.positive?
      manager_point = total_manager_point/total_factor if total_factor.positive?
  
      evaluation.update!(
        status: status,
        employee_point: employee_point.round(1),
        manager_point: manager_point.round(1),
        achievements: @request_params.achievements,
        positive_goals: @request_params.positive_goals,
        negative_goals: @request_params.negative_goals,
        overall_comments: @request_params.overall_comments,
        one_one_date: @request_params.one_one_date,
        employee_comments: @request_params.employee_comments,
        is_agree: @request_params.is_agree
      )
  
      @result = 'Cập nhật dữ liệu thành công.'
    end
  end
  