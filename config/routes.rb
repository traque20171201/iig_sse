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

    # resources :evaluations
    # resources :evaluation_details
    # resources :appraiser_evaluations
    get 'employee/evaluations/edit', to: 'employee_evaluations#edit'
    post 'employee/evaluations', to: 'employee_evaluations#save'
    post 'employee/evaluations/draff', to: 'employee_evaluations#draff'
    get 'employee/evaluations', to: 'employee_evaluations#show'
    get 'manager/evaluations', to: 'manager_evaluations#show'
    get 'appraiser/evaluations', to: 'appraiser_evaluations#show'
  end
end
