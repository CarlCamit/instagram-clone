Rails.application.routes.draw do
  root 'landing#index'
  devise_for :users
  resources :photos do
    resources :comments
  end
end
