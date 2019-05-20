Rails.application.routes.draw do
  root 'sessions#index'
  get '/signup' => 'parents#new'
  get '/login' => 'sessions#new'
  get '/auth/facebook/callback' => 'sessions#create'
  post '/login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get '/parents' => 'parents#new'
  get '/children' => 'children#new'
  get '/teachers' => 'teachers#new'
  resources :schools, only: [:show, :index] do
    resources :teachers, only: [:show, :new]
  end

  resources :children, only: [:new, :show, :create, :edit, :update]
  resources :parents, only: [:new, :show, :create, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
