Rails.application.routes.draw do
  # resources :ingredients
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'

  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :index]

  resources :recipes do
    resources :ingredients
  end
end
