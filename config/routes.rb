Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /vi|en/ do
    root to: 'home#index'

    devise_for :employees, controllers: {
      sessions: 'employees/sessions',
      registrations: 'employees/registrations'
    }
    devise_scope :employee do
      get "employees/show", to: 'employees/registrations#show'
    end

    get 'employee/evaluations/edit', to: 'employee_evaluations#edit'
    post 'employee/evaluations', to: 'employee_evaluations#save'
    get 'employee/evaluations', to: 'employee_evaluations#show'
    get 'employee/evaluations/feedback', to: 'employee_evaluations#feedback'
    post 'employee/evaluations/feedback', to: 'employee_evaluations#save_feedback'
    get 'manager/evaluations/list', to: 'manager_evaluations#list'
    get 'manager/evaluations/edit', to: 'manager_evaluations#edit'
    post 'manager/evaluations', to: 'manager_evaluations#save'
    get 'manager/evaluations', to: 'manager_evaluations#show'
    get 'appraiser/evaluations/list', to: 'appraiser_evaluations#list'
    get 'appraiser/evaluations/edit', to: 'appraiser_evaluations#edit'
    post 'appraiser/evaluations', to: 'appraiser_evaluations#save'
    get 'appraiser/evaluations', to: 'appraiser_evaluations#show'
    get 'guide', to: 'guide#index'
    get 'guide/employee', to: 'guide#employee'
    get 'guide/manager', to: 'guide#manager'
    get 'admin/employees/list', to: 'admin#list_employees'
    get 'admin/evaluations/list', to: 'admin#list_evaluations'
    post 'admin/password/reset', to: 'admin#reset_password'
    get 'admin/evaluations/edit', to: 'admin#edit_evaluation'
    post 'admin/evaluations/edit', to: 'admin#save_evaluation'
    post 'admin/employees/change_role', to: 'admin#change_role'
    get 'admin/evaluations/show', to: 'admin#show_evaluation'
    get 'admin/evaluations/result', to: 'admin#result_evaluations'
    get 'admin/evaluations/export', to: 'admin#export_evaluations'
    get 'report/evaluations/list', to: 'report#list_evaluations'
    get 'report/evaluations/show', to: 'report#show_evaluation'
    get 'report/evaluations/result', to: 'report#result_evaluations'
    get 'report/evaluations/export', to: 'report#export_evaluations'
    get 'report/evaluations/result/details', to: 'report#result_evaluations_details'
    get 'report/evaluations/export/details', to: 'report#export_evaluations_details'
  end
end
