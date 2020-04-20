Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    resources :taglists, only: [:index]
    collection do
      get 'search'
    end
  end
end
