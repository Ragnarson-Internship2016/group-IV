Rails.application.routes.draw do
  resources :recipes, only: [:index, :show]
  resources :ingredients, only: [:index]

  root 'ingredients#index'
end
