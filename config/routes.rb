Rails.application.routes.draw do
  root to: 'page#index'
  resources :articles
  resources :todos
  get 'signup', to: 'users#new'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'
  resources :users , except: [:new]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
