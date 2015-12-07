Rails.application.routes.draw do
  root 'pages#index'
  devise_for :users
  resources :resources  do
    member do
      get :mark_complete
      get :mark_incomplete
    end
  end
end
