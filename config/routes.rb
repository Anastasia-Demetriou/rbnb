Rails.application.routes.draw do
  get 'bids/index'
  get 'bids/show'
  get 'bids/create'
  get 'bids/new'
  get 'bids/edit'
  get 'bids/update'
  get 'bids/destroy'


  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
