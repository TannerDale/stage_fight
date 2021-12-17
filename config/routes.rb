Rails.application.routes.draw do
  root to: 'welcome#index'

  resources :projects, only: %i[new create]
end
