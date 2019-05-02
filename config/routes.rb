require 'resque/server'


Rails.application.routes.draw do
  # devise_for :admin_users, {class_name: 'User'}.merge(ActiveAdmin::Devise.config)
  devise_for :users
  ActiveAdmin.routes(self)
  devise_scope :user do
    get '/users/sign_out' , :to => 'active_admin/devise/sessions#destroy'
  end
  resources :products
  post 'add_to_cart' , to: 'cart_products#add_to_cart', as: 'add_to_cart'
  get 'template/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'template/single'
  get 'stores' , to: 'stores#index'
  get 'stores/:id' , to: 'stores#show', as: 'store'

  root to: 'template#index'

  mount Resque::Server.new, at: "/resque"

end
