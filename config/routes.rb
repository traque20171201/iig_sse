Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /vi|en/ do
    root to: 'home#index'

    devise_for :employees, controllers: {
      sessions: 'employees/sessions',
    }
    devise_scope :employee do
      get "employees/show", to: 'employees/registrations#show'
    end

    get 'employee/evaluations/edit', to: 'employee_evaluations#edit'
    post 'employee/evaluations', to: 'employee_evaluations#save'
    get 'employee/evaluations', to: 'employee_evaluations#show'
    get 'manager/evaluations/list', to: 'manager_evaluations#list'
    get 'manager/evaluations/edit', to: 'manager_evaluations#edit'
    post 'manager/evaluations', to: 'manager_evaluations#save'
    get 'manager/evaluations', to: 'manager_evaluations#show'
    get 'appraiser/evaluations', to: 'appraiser_evaluations#show'
    get 'guide', to: 'guide#index'
  end
end
