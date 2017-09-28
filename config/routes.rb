Rails.application.routes.draw do
  root 'landing#index'
  devise_for :users
  resource :profile
  resources :photos do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end
end
