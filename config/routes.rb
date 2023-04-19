Rails.application.routes.draw do

  resources :dishes, only: [:show] do
  #  resources :dish_ingredients, only: [:create]
  end

  resources :chefs, only: [:show] do
    # resources :ingredients, only: [:index]
  end
  

  get '/dishes/:id', to: 'dishes#show' 
  post '/dishes/:id', to: 'dish_ingredients#create'

  get '/chefs/:id/ingredients', to: 'chefs/ingredients#index'
end
