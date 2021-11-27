Rails.application.routes.draw do
  devise_for :users
  root to: 'prospects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :prospects do
    resources :conversations, only: [:new, :create]
  end
end
