Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index] do
    resource :following_relationship, only: [:create, :destroy]
  end

  resources :shouts, only: [:index] do
    resource :favorite, only: [:create, :destroy]
  end
  resources :text_subjects, only: [:create]
  resources :image_subjects, only: [:create]
  resources :followers, only: [:index]
  resource :search, only: [:show]

  get "/:username", to: "users#show", as: "user"

  root "shouts#index"
end
