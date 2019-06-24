Rails.application.routes.draw do
  get 'exercises/index'
  get 'exercises/new'

  devise_for :users

  root 'dashboards#index'

  resources :users do
    resources :exercises
  end
end
