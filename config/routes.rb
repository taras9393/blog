Rails.application.routes.draw do

 root 'statpages#home'
 get 'one' => 'statpages#one_post'
 get 'userss' => 'statpages#users_all'
 get 'profilee' => 'statpages#user_profile'
 get 'registration' => 'statpages#registration'
 get 'login' => 'statpages#login'
end
