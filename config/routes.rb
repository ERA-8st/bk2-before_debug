Rails.application.routes.draw do
  root 'home#top'
  get 'home/about'
  get "search" => "search#search"
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update] do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end