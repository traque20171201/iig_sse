# frozen_string_literal: true

class GetEvaluationsForAppraiserService
  attr_reader :result
  
  def initialize(request_params)
    @request_params = request_params
  end

  def run!
    @result = Evaluation.where(appraiser_id: @request_params.employee_id)
  end
end
