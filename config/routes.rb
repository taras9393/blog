Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:index, :show, :destroy]
  resources :articles do
    member do
      put 'vote'
    end
    resources :comments
  end
  resources :categories
  resources :propositions do
    member do
      put 'accept'
    end
  end

  root 'statpages#home'
  get 'profile' => 'users#profile'
end
