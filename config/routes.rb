Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products do
      resources :reviews
    end
  end
  get 'products/' => 'products#index'
  get 'reviews/:id' => 'reviews#show', as: :reviews
  resources :reviews, only: [:index]
  root 'reviews#index'
end
