Rails.application.routes.draw do


resources :events
  devise_for :users
  root to: 'pages#home'

  resources :events

  resources :users do
    resources :bids  do
      get 'bookings/show'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
