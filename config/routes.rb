Rails.application.routes.draw do

  get 'users/show'
  devise_for :users
  resources :users, only: %i[show]

  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Add upon these routes as and when you need to make a view
  resources :treehouses, only: %i[index show new create destroy] do
    resources :bookings, only: %i[new create]
  end
  resources :bookings, only: %i[destroy]
end
