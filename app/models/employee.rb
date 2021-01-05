# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :department
  has_many :evaluations

  PASSWORD_FORMAT = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[[:^alnum:]])/x

  enum role: {employee: 0, manager: 1, admin: 9}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable

  validates :password, :presence => true,
                       :length => {:within => 8..40},
                       :format => {:with => PASSWORD_FORMAT},
                       :on => :create
  validates :password, :presence => true,
                       :length => {:within => 8..40},
                       :format => {:with => PASSWORD_FORMAT},
                       :allow_blank => true,
                       :on => :update

  def self.human_enum_name(enum_name, enum_value)
    I18n.t("activerecord.attributes.#{model_name.i18n_key}.#{enum_name.to_s.pluralize}.#{enum_value}")
  end

  def manager?
    return true if role_before_type_cast.positive?

    return false
  end

  def admin?
    return true if role == 9

    return false
  end
end
