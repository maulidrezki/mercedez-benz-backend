Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'index', to: 'museums#index'
  # Defines the root path route ("/")
  # root "articles#index"
  root 'museums#index'
end
