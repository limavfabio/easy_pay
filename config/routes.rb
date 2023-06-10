# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  get 'splash/index'
  devise_for :users
  resources :payments
  resources :groups
  resources :users, except: %i[show index edit update destroy]

  root to: 'groups#index'
end
