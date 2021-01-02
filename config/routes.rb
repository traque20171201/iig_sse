Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '(:locale)', locale: /vi|en/ do
    root to: 'home#index'

    devise_for :employees, controllers: {
      sessions: 'employees/sessions',
      registrations: 'employees/registrations',
      passwords: 'employees/passwords',
    }
    devise_scope :employee do
      get "employees/show", to: 'employees/registrations#show'
    end

    resources :evaluations
  end
end
