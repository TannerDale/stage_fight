Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[new create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'

  get '/', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  # Defines the root path route ("/")
  # root "articles#index"
end
