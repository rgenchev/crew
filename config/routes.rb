Rails.application.routes.draw do
  root 'dashboard#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :teams, param: :slug

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :about, only: [:index]
end
