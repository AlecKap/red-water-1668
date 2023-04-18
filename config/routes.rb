Rails.application.routes.draw do

  resources :dishes, only: [:show] do
  #  resources :dish_ingredients, only: [:create]
  end
  

  get '/dishes/:id', to: 'dishes#show' 
  post '/dishes/:id', to: 'dish_ingredients#create' 
end
