Rails.application.routes.draw do
  root 'dashboard#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :teams, param: :slug
  resources :users, only: [:index, :show], param: :username

  get 'about', to: 'about#index'

  namespace "my" do
    get 'account', to: 'users#edit'
    put 'account', to: 'users#update'
    patch 'account/change_password', to: 'users/change_password#update'
  end

  namespace :admin do
    resources :users
  end
end
