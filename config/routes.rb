Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :users, only: [:edit, :update]
  resources :items do
    collection do
      get 'search'
    end
  end
end
