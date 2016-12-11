Rails.application.routes.draw do
  # resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'recipes#index'

  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :index]

  resources :recipes do
    resources :ingredients
    # put :favorite, on: :member
  end

  get "users/:id/shopping", to: 'users#shopping', as: :user_shopping_list
  get "ingredients/:id/delete_item", to: 'ingredients#delete_item', as: :destroy_user_item
  get "recipes/:id/add_to_shopping_list", to: 'recipes#shopping', as: :recipe_add_to_shopping_list

  get "users/:id/favorites_data", to: 'users#favorites_data'

  get "recipes/:id/favorite", to: 'recipes#favorite'
  get "recipes/:id/unfavorite", to: 'recipes#unfavorite'

  get "ingredients/:id", to: 'ingredients#show'
end
