# frozen_string_literal: true

class Evaluation < ApplicationRecord
  belongs_to :employee
  has_many :evaluation_details

  enum status: {'Nhân viên chưa đánh giá': 0, 'Nhân viên đang đánh giá': 1, 'Nhân viên hoàn thành đánh giá': 2, 'Quản lý trực tiếp đang đánh giá': 3,
                'Quản lý trực tiếp hoàn thành đánh giá': 4, 'Quản lý thẩm định đang đánh giá': 5, 'Hoàn thành đánh giá': 6}

  def get_is_agree
    return 'X' if is_agree
  end

  def get_not_agree
    return nil if is_agree.nil?
    return 'X' if !is_agree
  end

  def get_employee_rank
    return nil if employee_point.nil?

    return 'A' if employee_point >= 3.5

    return 'B' if employee_point > 2.7 && employee_point < 3.5

    return 'C' if employee_point > 1.8 && employee_point <= 2.7

    return 'D' if employee_point <= 1.8
  end

  def get_manager_rank
    return nil if manager_point.nil?

    return 'A' if manager_point >= 3.5

    return 'B' if manager_point > 2.7 && manager_point < 3.5

    return 'C' if manager_point > 1.8 && manager_point <= 2.7

    return 'D' if manager_point <= 1.8
  end

  def get_appraiser_rank
    return nil if appraiser_point.nil?

    return 'A' if appraiser_point >= 3.5

    return 'B' if appraiser_point > 2.7 && appraiser_point < 3.5

    return 'C' if appraiser_point > 1.8 && appraiser_point <= 2.7

    return 'D' if appraiser_point <= 1.8
  end

  def get_avg
    return nil if manager_point.nil?

    return nil if manager_point.nil? && appraiser_point.nil?

    return manager_point if appraiser_point.nil?

    avg_point = (manager_point + appraiser_point)/2
  end

  def get_avg_rank
    return nil if get_avg.nil?

    avg_point = get_avg

    return 'A' if avg_point >= 3.5

    return 'B' if avg_point > 2.7 && avg_point < 3.5

    return 'C' if avg_point > 1.8 && avg_point <= 2.7

    return 'D' if avg_point <= 1.8
  end
end
