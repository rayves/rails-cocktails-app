Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/cocktails', to: 'cocktails#index', as: 'cocktails'
  post '/cocktails', to: 'cocktails#create', as: 'create_cocktail'
    #prefixes apply to all routes under it until a new prefix is created
  get '/cocktails/new', to: 'cocktails#new', as: 'new_cocktail'
  get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
    # :id -> this is a dynamic variable
      # represents anything after the slash
  put '/cocktails/:id', to: 'cocktails#update', as: 'update_cocktail'
  patch '/cocktails/:id', to: 'cocktails#update'
    # referencing the same action is okay, when routing occurs put or patch will just lead to the same action.
  delete '/cocktails/:id', to: 'cocktails#destroy'
    # ruby already has a built in key word called delete therefore the method cannot be named delete.
  get '/cocktails/:id/edit', to: 'cocktails#edit', as: 'edit_cocktail'
end
