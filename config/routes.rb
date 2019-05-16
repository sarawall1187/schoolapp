Rails.application.routes.draw do
  root 'sessions#index'
  get '/signup' => 'parents#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  resources :schools
  resources :teachers
  
  resources :children
  resources :parents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
