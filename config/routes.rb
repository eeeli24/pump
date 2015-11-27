Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :resources, only: [:index, :new, :create, :show] do
    member do
      get :mark_complete
      get :mark_incomplete
    end
  end
end
