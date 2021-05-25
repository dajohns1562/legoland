Rails.application.routes.draw do


  get '/users/clear', to: 'users#clear', as: 'clear'
  root :to => 'pages#home'
  get '/success', to: 'pages#success'
  get '/build', to: 'pages#build'

  resources :topics
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    # Login Sessions
 # Login Sessions
  get '/login' => 'session#new'
  post '/login' => 'session#login'
  delete '/login' => 'session#destroy'

end
