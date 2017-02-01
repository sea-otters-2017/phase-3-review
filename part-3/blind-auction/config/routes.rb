Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/new'

  resources :user

  root 'application#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
