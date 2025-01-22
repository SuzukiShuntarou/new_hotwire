Rails.application.routes.draw do
  devise_scope :user do
    root to: 'users/sessions#new'
  end
  devise_for :users

  # Defines the root path route ("/")
  # root "posts#index"
end
