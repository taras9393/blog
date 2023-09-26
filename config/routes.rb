Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :articles
  resources :categories

  root 'statpages#home'
  get 'profile' => 'users#profile'


end
