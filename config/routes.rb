Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'template/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'template/single'

  root to: 'template#index'
end
