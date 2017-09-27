Rails.application.routes.draw do
  root 'landing#index'
  devise_for :users
  resources :photos do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end
end
