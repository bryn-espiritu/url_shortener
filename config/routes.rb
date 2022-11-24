Rails.application.routes.draw do
  devise_for :users
  root "posts#new"
  get '/:code', to: 'links#show'
  post '/links', to: 'links#create'

  resources :posts, only: :show
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/s/:slug', to: 'links#show', as: :short
  # get '/s/:slug', to: 'links#slug'
  # Defines the root path route ("/")
  # root "articles#index"
end
