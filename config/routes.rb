Rails.application.routes.draw do
  root 'sessions#index'
  get '/signup' => 'parents#new'
  get '/login' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/parents' => 'parents#new'
  get '/children' => 'children#new'
  get '/parents/teachers/new' => 'teachers#new'
  post '/parents/teachers' => 'teachers#create'
  resources :schools, only: [:show, :index] do
    resources :teachers, only: [:show, :new, :create, :index] 
  end
  resources :teachers, only: [:create, :show, :index, :new]

  resources :children, only: [:new, :show, :create, :edit, :update, :destroy]
  resources :parents, only: [:new, :show, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
