Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :articles
  resources :categories

  root 'statpages#home'
  get 'one' => 'statpages#one_post'
  get 'userss' => 'statpages#users_all'
  get 'profilee' => 'statpages#user_profile'


end
