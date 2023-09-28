Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :articles
  resources :categories
  resources :propositions do
    put 'accept'
  end

  root 'statpages#home'
  get 'profile' => 'users#profile'
  put 'accept' => 'propositions#accept'
end
