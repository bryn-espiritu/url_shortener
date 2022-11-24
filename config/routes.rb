Rails.application.routes.draw do
  resources :links
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get '/s/:slug', to: 'links#show', as: :short
  get '/s/:slug', to: 'links#slug'
  # Defines the root path route ("/")
  # root "articles#index"
end
