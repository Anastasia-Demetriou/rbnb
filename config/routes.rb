Rails.application.routes.draw do

root to: 'pages#home'
get 'professional_dashboard', to: 'pages#professional_dashboard', as: 'professional_dashboard'
get 'event_dashboard', to: 'pages#event_dashboard', as: 'event_dashboard'
resources :events do
  resources :bids  do
    get 'bookings/show'
  end
end
  devise_for :users

  resources :users


  #devise_for :users, :controllers => {:registrations => "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

