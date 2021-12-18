Rails.application.routes.draw do
  root to: 'welcome#index'

  resource :users, only: %i[new create]
  get :dashboard, controller: :users, action: :show

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'

  resources :projects, only: %i[new create]
end
