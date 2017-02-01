Rails.application.routes.draw do
  resources :users, :auctions, :logins
  resources :auctions do
    resources :bids
  end

  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
