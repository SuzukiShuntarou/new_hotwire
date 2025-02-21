Rails.application.routes.draw do
  devise_scope :user do
    root to: 'users/sessions#new'
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  resources :users, only: [:index, :show]
  resources :rewards
  resources :goals

  resources :treats
  resources :marks
  # Defines the root path route ("/")
  # root "posts#index"
end
