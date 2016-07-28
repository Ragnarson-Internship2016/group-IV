Rails.application.routes.draw do

  get 'contact' => 'contact#index'
  get 'recipes/random' => 'recipes#random'

  resources :recipes,     only: [:index, :show]
  resources :ingredients, only: [:index]

  namespace :admin do
    root 'admin/recipes#index'
    resources :recipes,     except: [:show]
    resources :ingredients, except: [:show]
  end

  root 'ingredients#index'
end
