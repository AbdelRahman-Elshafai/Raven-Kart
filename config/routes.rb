require 'resque/server'
require 'resque/scheduler/server'


Rails.application.routes.draw do
  # devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  devise_for :users
  ActiveAdmin.routes(self)
  devise_scope :user do
    get '/users/sign_out' , :to => 'active_admin/devise/sessions#destroy'
  end
  resources :products
  get 'shopping_cart', to: 'shopping_cart#show', as: 'shopping_cart'
  post 'add_to_cart' , to: 'cart_products#add_to_cart', as: 'add_to_cart'
  get 'remove_from_cart/:id', to: 'cart_products#remove_from_cart', as: 'remove_from_cart'
  get 'empty_cart', to: 'shopping_cart#empty_cart'
  get 'template/index'
  get 'template/single'
  get 'template/shopping'
  get 'stores' , to: 'stores#index', as:'stores'
  get 'stores/:id' , to: 'stores#show', as: 'store'
  post 'orders', to: 'order#create', as: 'orders'
  get 'order/:id', to: 'order#show', as:'order'
  get 'confirm_status/:id', to: 'requests#confirm_status', as: 'confirm_status'
  get 'deliver_status/:id', to: 'requests#deliver_status', as: 'deliver_status'
  get 'requests/:id', to: 'requests#show', as: 'request'




  root to: 'template#index'

  get 'search', to: 'search#search', as: 'search_products'

  mount Resque::Server.new, at: "/resque"

end
