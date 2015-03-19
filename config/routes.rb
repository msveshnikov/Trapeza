Trapeza::Application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

  resources :comments, only: [:create, :destroy]

  get 'recipes/toggle/:id', to: 'recipes#toggle'
  get 'recipes/popular', to: 'recipes#popular'
  resources :recipes
  resources :categories
  root 'categories#index'
end
