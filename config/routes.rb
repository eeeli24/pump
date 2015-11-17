Rails.application.routes.draw do
  root 'resources#index'
  resources :resources, only: [:index, :new, :create, :show]
end
