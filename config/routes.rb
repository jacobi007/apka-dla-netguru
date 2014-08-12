Rails.application.routes.draw do
  resources :reviews, only: [:index, :show]
  resources :categories do
    resources :products do
      resources :reviews
    end
  end
  get 'products/' => 'products#index'
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  root 'reviews#index'

end
