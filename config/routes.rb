Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static#index'

  devise_for :users, controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show, :index] do
    resources :recipes #, only: [:show, :edit, :new, :create, :update, :destroy]
  end

  resources :recipes
end
