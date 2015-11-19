Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :resources, only: [:index, :new, :create, :show]
end
