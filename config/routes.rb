Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  get 'contact' => 'pages#contact'
  get 'about' => 'pages#about'
  resources :pages, only: [:create]
  resources :tours, only: [:index,:show]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
