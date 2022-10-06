Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy]
  resources :tasks, only: [:index, :show, :create, :update, :destroy]
  post "/login", to: "users#login"
end
