Rails.application.routes.draw do
  get 'registrations/index'
  get 'exercises/index'
  get 'exercises/new'

  devise_for :users, :controllers => {registrations: "registrations"}

  root 'dashboards#index'

  resources :users do
    resources :exercises
  end
end
