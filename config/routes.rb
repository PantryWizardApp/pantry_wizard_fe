Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "welcome#index"
  get "dashboard", to: "users#show"
  get "shopping_list", to: "shopping_list#show"
  get "/auth/:provider/callback", to: "sessions#create"
  delete "/logout", to: "sessions#log_out"
  get "/about", to: "about#index"
  
  get "/meals/:id", to: "recipes#show"
end
