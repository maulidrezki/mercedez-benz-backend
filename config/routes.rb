Rails.application.routes.draw do
  get '/museums' => 'museums#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'museums#index'
end
