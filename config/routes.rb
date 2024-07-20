Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    resource :session, only: %i[new create destroy]

    resources :users, only: %i[new create edit update]

    resources :questions do
      resources :answers, except: %i[new show]
    end

    # resources :pages, only: %i[show]
    get "all" => "questions#all"

    root 'pages#index'
    get "up" => "rails/health#show", as: :rails_health_check
  end
end