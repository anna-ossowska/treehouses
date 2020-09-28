Rails.application.routes.draw do

  devise_for :users

  root to: 'treehouses#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # Add upon these routes as and when you need to make a view
  resources :treehouses, only: %i[home index show]
end
