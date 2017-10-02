Rails.application.routes.draw do
  
  root 'landing#index'
  devise_for :users
  resources :users, only: [:show, :update], controller: :profiles
  resource :profile
  resources :photos do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end
  get '/feed' => 'feed#index'
end
