Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
 
  # categories controller 
  resources :categories
  
  resource :account
  
  resources :items
  
  resources :users

  resource :session

  get "about", to: "pages#about"
  
  root "pages#home"
end
