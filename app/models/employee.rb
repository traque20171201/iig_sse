# frozen_string_literal: true

class Employee < ApplicationRecord
  paginates_per 20

  belongs_to :department
  has_many :evaluations

  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

  enum role: {employee: 0, manager: 1, ceo: 2, chairman: 3, admin: 9}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable

  validates :password, :presence => true,
                       :length => {:within => 8..40},
                       :format => {:with => PASSWORD_FORMAT},
                       :on => :create
  validates :password, :presence => true,
                       :length => {:within => 8..40},
                       :format => {:with => PASSWORD_FORMAT},
                       :allow_blank => true,
                       :on => :update

  scope :where_by_department_id, ->(department_id) { where(department_id: department_id) if department_id.present? }

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def manager?
    return true if role_before_type_cast.positive?

    return false
  end

  def admin?
    return true if role_before_type_cast == 9

    return false
  end

  def ceo?
    return true if role_before_type_cast >= 2

    return false
  end

  def feedback?
    evaluation = Evaluation.find_by(:employee_id => id)

    return false if evaluation.blank?

    return true if [4, 7].include?(evaluation&.status_before_type_cast)

    return false
  end
end
