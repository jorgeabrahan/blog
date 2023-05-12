Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, controller: 'users/posts' do
      resources :comments, only: [:new, :create], controller: 'users/posts/comments'
      resources :likes, only: [:new, :create], controller: 'users/posts/likes'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
