Rails.application.routes.draw do
 
  resources :topics
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


    # Login Sessions
 # Login Sessions
  get '/login' => 'session#new'
  post '/login' => 'session#login'
  delete '/login' => 'session#destroy'

end
