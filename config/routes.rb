Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/cocktails', to: 'cocktails#index', as: 'cocktails'
  post '/cocktails', to: 'cocktails#create'
    #prefixes apply to all routes under it until a new prefix is created
  get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
    # :id -> this is a dynamic variable
      # represents anything after the slash
end
