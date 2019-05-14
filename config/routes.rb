Rails.application.routes.draw do
  resources :schools
  resources :teachers
  resources :children
  resources :parents
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
