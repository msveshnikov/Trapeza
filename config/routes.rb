Trapeza::Application.routes.draw do
  resources :recipes

  resources :categories
  root 'categories#index'
end
