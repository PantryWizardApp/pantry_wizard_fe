Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get "dashboard", to: "users#show"
  get "/auth/:provider/callback", to: "sessions#create"

  get "/about", to: "about#index"
end
