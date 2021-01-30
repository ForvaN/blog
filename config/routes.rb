Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:show, :index]
  resources :tags, only: [:show]
  resources :categories, only: [:show]

  root "posts#index"

  namespace :admin do
    resources :posts, except: [:show, :index]
    resources :categories, except: [:show]
  end

end
