# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
    used the rails gem to create app

- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
    Parents have many children, teachers have many children, schools have many teachers

- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) Child belongs to teacher, child belongs to parent, teacher belongs to school

- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) Parents have many teachers through children, teachers have many parents through children

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) Parents have many teachers through children, teachers have many parents through children

- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) Child has a name and age to submit

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) All Models have validations for presence for every attribute, validation to email for uniqueness

- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) children has scope method to order them by age, teacher have scope method to order by grade taught
- [x] Include signup (how e.g. Devise)
    get '/signup' => parents#new
- [x] Include login (how e.g. Devise)
    get '/login' => sessions#new
- [x] Include logout (how e.g. Devise)
    delete '/logout' => sessions#destroy
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
    get '/auth/facebook/callback' => 'sessions#create'
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
    resources :schools, only: [:show, :index] do
        resources :teachers, only: [:show, :new, :create]
    end
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
    resources :schools, only: [:show, :index] do
        resources :teachers, only: [:show, :new, :create]
    end
- [x] Include form display of validation errors (form URL e.g. /recipes/new)
    display field_with errors_when form not fully filled out using errors.full_messages and red border, error message when user tries to access pages with out being logged in (before_action :require_login)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate