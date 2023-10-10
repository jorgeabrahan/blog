Rails.application.routes.draw do
  namespace :users do
    get 'posts/index'
    get 'posts/show'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
