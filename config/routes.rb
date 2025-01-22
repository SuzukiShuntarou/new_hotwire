Rails.application.routes.draw do
  devise_scope :user do
    root to: 'users/sessions#new'
  end
  devise_for :users
  resources :users, only: [:index, :show]
  # Defines the root path route ("/")
  # root "posts#index"
end
