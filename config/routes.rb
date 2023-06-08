# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  resources :payments
  resources :groups, except: [:show]
  resources :users

  root to: 'groups#index'
end
