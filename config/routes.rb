Rails.application.routes.draw do

  get 'articles/new'
  get 'articles/edit'
  get 'articles/index'
  get 'articles/show'
  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :articles
  
  root 'statpages#home'
  get 'one' => 'statpages#one_post'
  get 'userss' => 'statpages#users_all'
  get 'profilee' => 'statpages#user_profile'


end
