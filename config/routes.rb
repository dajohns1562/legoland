Rails.application.routes.draw do

  get '/users/clear', to: 'users#clear', as: 'clear'
  
  resources :topics
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
