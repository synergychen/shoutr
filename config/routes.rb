Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :index, :show] do
    resource :following_relationship, only: [:create, :destroy]
  end
  resources :shouts, only: [:index]
  resources :text_subjects, only: [:create]
  resources :image_subjects, only: [:create]

  root "shouts#index"
end
