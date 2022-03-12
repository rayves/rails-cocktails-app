Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/cocktails', to: 'cocktails#index', as: 'cocktails'
  get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
    # :id -> this is a dynamic variable
      # represents anything after the slash
end
